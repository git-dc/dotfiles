function kb380Config {
    printf "\n${bld}kb380 config...${nrm}\n\n"
    sudo apt-get install build-essential
    mkdir -p ../.kb380
    git clone git@github.com:jergusg/k380-function-keys-conf.git ../.kb380
    cd ../.kb380/
    sudo make install
    printf "\n${bld}kb380 config done.${nrm}\n\n"

    sudo ./fn_on.sh
    printf "please run 'sudo k380_conf -d /dev/hidrawX -f on' "
    printf "where X is the number of the hidraw shown above.\n"
    printf "please run 'sudo make reload' to fn-lock the kb380 on every boot, "
    printf "then run 'sudo make reload'"

}
