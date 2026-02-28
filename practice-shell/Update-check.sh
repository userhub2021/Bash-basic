#1/bin/bash

update_check(){
    echo "starting update check for npm packages..."
    npm outdated -g
if [ $? -eq 0 ]; then
     ehco "All npm packages are up to date."
else
    echo "Some npm packages are outdated. Please consider updating then,."
    echo "$(read -p "Do you want to update all global npm packages? (y/n):)" answer
    if [ "$answer" == "y" ]; then
        npm update -g 
        if [ $? -eq 0 ]; then
            echo "All global npm packages have been updated successfully."
        else
            echo "Failed to update global npm packages. Please check the error messages above."
        fi
    elif [ "$answer" == "Y" ]; then
        echo "Please enter the y or n in lowercase."
    else
        echo "Update canceled by user."
    fi
fi
}