#!/bin/bash
SELF=`pwd`/userconfig.sh
USER_LIST=( )
GROUP=general #指定创建用户所在组

# 指定用户密码
function initPass() {
    # echo `cat /dev/urandom | head -n 10 | md5sum | head -c 6` #随机用户密码
    echo "passw0rd" 
}
if [ "$1" = 'help' ] || [ "$1" = 'h' ];then
    echo "help or h:   this message"
    echo "create or c: create an account"
    echo "delete or d: delete an account"
    echo "default:     create the a bundle of accounts in user_list."
    echo "have fun!!!"
elif [ "$1" = 'create' ] || [ "$1" = 'c' ];then
    #create group if not exists
    egrep "^$GROUP" /etc/group >& /dev/null
    if [ $? -ne 0 ];then
        sudo groupadd $GROUP &&\
        echo "created $GROUP"
    fi
    #create user if not exists
    egrep "^$2" /etc/passwd >& /dev/null
    if [ $? -ne 0 ];then
        PASS=$(initPass)
        sudo useradd -s /bin/zsh -d /home/$2 -g $GROUP -m $2 &&\
        echo $2:$PASS | sudo chpasswd  &&\
        echo "creating $2 initial password is: $PASS" &&\
        # sed -i '_bak' "/^USER_LIST/s/)/ '$2')/" "$SELF"
        sed -i "/^USER_LIST/s/)/ '$2')/" "$SELF"
        echo "created $USER initial password is: $PASS" >> userlist.txt
    fi
elif [ "$1" = 'delete' ] || [ "$1" = 'd' ];then
    sudo userdel -r $2 &&\
    echo "deleted $2" &&\
    # sed -i '_bak' "/^USER_LIST/s/ '$2'//" "$SELF"
    sed -i "/^USER_LIST/s/ '$2'//" "$SELF"
elif [ "$1" = 'help' ] || [ "$1" = 'h' ];then
    echo "This is a userconfig script and the parameter:"
    echo "    create or c for create an acount "
    echo "    delete or d for delete an aounnt "
    echo "    help or h for this message "
    echo "and by default there is creating a full list of users!!!"
else
    for USER in ${USER_LIST[*]}
    do
            #create group if not exists
            egrep "^$GROUP" /etc/group >& /dev/null
            if [ $? -ne 0 ];then
                sudo groupadd $GROUP &&\
                echo "created $GROUP"
            fi

            #create user if not exists
            egrep "^$USER" /etc/passwd >& /dev/null
            if [ $? -ne 0 ];then
                PASS=$(initPass)
                sudo useradd -s /bin/zsh -d /home/$USER -g $GROUP -m $USER &&\
                echo $USER:$PASS | sudo chpasswd &&\
                echo "created $USER initial password is: $PASS"
                echo "created $USER initial password is: $PASS" >> userlist.txt
            fi

    done
fi


