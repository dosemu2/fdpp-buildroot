clean() {
    ./make.sh $1-dirclean
    rm -rf buildroot/dl/$1
}

clean comcom64
clean dj64dev
clean dosemu2
clean fdpp
clean thunk_gen
