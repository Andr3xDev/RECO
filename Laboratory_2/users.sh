#!/bin/bash

#--------------------------------------------------------
# Validate the given params
#--------------------------------------------------------
function validate_parameters() {
    if [[ "$1" == "newuser" ]]; then
        create_user "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
    elif [[ "$1" == "newgroup" ]]; then
        create_group "$2" "$3"
    else
        echo "Some parametters are wrong"
        exit 1
    fi
}


#--------------------------------------------------------
# Creates user with specifications
#--------------------------------------------------------
function create_group() {
    groupname="$1"
    gid="$2"
    if getent group "$groupname" >/dev/null; then
        echo "El grupo '$groupname' ya existe."
    else
        echo "Creando grupo '$groupname' con GID $gid..."
        groupadd -g "$gid" "$groupname"
        echo "Grupo '$groupname' creado correctamente."
    fi
}


#--------------------------------------------------------
# Creates user with specifications
#--------------------------------------------------------
function create_user() {
    # Parameters
    username="$1"
    group="$2"
    fullname="$3"
    home_dir="$4"
    shell="$5"
    perm_user="$6"
    perm_group="$7"
    perm_other="$8"

    # Create the group if it doesn't exist
    if ! getent group "$group" >/dev/null; then
        echo "Creando grupo '$group'..."
        groupadd "$group"
    fi

    # Create the user and assign to the group
    echo "Creando usuario '$username'..."
    useradd -m -d "$home_dir" -s "$shell" -c "$fullname" -g "$group" "$username"

    # Set permissions
    chmod "$perm_user" "$home_dir"
    chmod "$perm_group" "$home_dir"
    chmod "$perm_other" "$home_dir"

    echo "Usuario '$username' creado correctamente en el grupo '$group' con permisos $perm_user $perm_group $perm_other."
}


#--------------------------------------------------------
# Main function to start the script
#--------------------------------------------------------
function main() {
    clear
    validate_parameters
}

main