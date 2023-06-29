#!/bin/bash
(crontab -l && echo "* * * * * bash ~/testing_cron/scripts/print.sh >> ~/testing_cron/outputs/print_2.txt") | crontab -