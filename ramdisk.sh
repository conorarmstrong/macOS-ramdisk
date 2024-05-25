#!/bin/bash

# Function to create a RAM disk
create_ramdisk() {
    local size_gb=$1
    local sectors=$(($size_gb * 2048 * 1024)) # Correct calculation for 512-byte sectors

    diskutil erasevolume HFS+ 'RAMDisk' `hdiutil attach -nomount ram://$sectors`
}

# Function to list all disks including the RAM disk
list_disks() {
    diskutil list
}

# Function to destroy the RAM disk
destroy_ramdisk() {
    local ramdisk_mount_point=$(mount | grep 'RAMDisk' | awk '{print $3}')

    if [ -n "$ramdisk_mount_point" ]; then
        diskutil unmount "$ramdisk_mount_point"
        local disk_identifier=$(diskutil list | grep 'RAMDisk' | awk '{print $NF}')
        if [ -n "$disk_identifier" ]; then
            hdiutil detach "/dev/$disk_identifier"
        fi
    else
        echo "No RAMDisk found."
    fi
}

# Function to display usage information
usage() {
    echo "Usage: $0 -c [size]GB | -l | -d"
    echo "  -c [size]GB  Create a RAM disk of specified size in GB."
    echo "  -l           List all disks including the RAM disk."
    echo "  -d           Destroy the RAM disk."
}

# Parse command-line options
while getopts ":c:ld" opt; do
    case ${opt} in
        c )
            size_in_gb=${OPTARG%GB}
            if [[ $size_in_gb =~ ^[0-9]+$ ]]; then
                create_ramdisk $size_in_gb
            else
                echo "Invalid size specified. Please use an integer value followed by GB."
                usage
                exit 1
            fi
            ;;
        l )
            list_disks
            ;;
        d )
            destroy_ramdisk
            ;;
        \? )
            echo "Invalid option: -$OPTARG" >&2
            usage
            exit 1
            ;;
        : )
            echo "Option -$OPTARG requires an argument." >&2
            usage
            exit 1
            ;;
    esac
done

# If no options are provided, display usage information
if [ $OPTIND -eq 1 ]; then
    usage
fi

shift $((OPTIND -1))
