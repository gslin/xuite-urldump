# xuite-urldump

Xuite has decided to close its service at 14:00, Aug 31 2023 (GMT+0800), so we need to backup and create snapshots into Wayback Machine.

This script creates all article urls so that you can submit them into Wayback Machine.

Xuite決定在2023年8月31日14:00關閉服務，所以我們需要備份並且將網頁存檔放到Wayback Machine上。

這隻script會產生所有文章連結，你可以用這些連結讓Wayback Machine備份網頁。

## Usage

Syntax:

    ./xuite-urldump.pl [baseurl]

For example:

    ./xuite-urldump.pl blog.xuite.net/xuite.net/xuite

## Submit to Wayback Machine

You can use [Wayback Machine Archiver](https://github.com/agude/wayback-machine-archiver) to submit them, like:

    cat urls.txt | xargs -t -n1 archiver

Please note it's not fast because of Wayback Machine's resource constraints.

## License

See [LICENSE](LICENSE).
