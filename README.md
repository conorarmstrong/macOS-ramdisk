# RAM Disk Manager

RAM Disk Manager is a simple shell script to manage RAM disks on macOS. With this script, you can easily create, list, and destroy RAM disks of specified sizes.

## Features

- **Create** a RAM disk of a specified size in GB.
- **List** all disks, including the RAM disk.
- **Destroy** the RAM disk.

## Usage

### Prerequisites

- macOS
- Terminal

### Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/ramdisk-manager.git
    cd ramdisk-manager
    ```

2. Make the script executable:

    ```sh
    chmod +x ramdisk_manager.sh
    ```

### Commands

- **Create a RAM disk**:

    ```sh
    ./ramdisk_manager.sh -c [size]GB
    ```

    Replace `[size]` with the desired size in GB. For example, to create an 8GB RAM disk:

    ```sh
    ./ramdisk_manager.sh -c 8GB
    ```

- **List all disks**:

    ```sh
    ./ramdisk_manager.sh -l
    ```

- **Destroy the RAM disk**:

    ```sh
    ./ramdisk_manager.sh -d
    ```

## Examples

- **Create a 4GB RAM disk**:

    ```sh
    ./ramdisk_manager.sh -c 4GB
    ```

- **List all disks**:

    ```sh
    ./ramdisk_manager.sh -l
    ```

- **Destroy the RAM disk**:

    ```sh
    ./ramdisk_manager.sh -d
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Conor Armstrong

Feel free to contribute by opening issues or submitting pull requests. Your feedback is highly appreciated!

## Contact

If you have any questions or suggestions, feel free to reach out to me at conorarmstrong@gmail.com.
