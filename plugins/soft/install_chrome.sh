# Name: Install Google Chrome
# Command: install_chrome

install_chrome() {
show_func "Installing Google Chrome"
if [[ "$(install_chrome_test)" = "Installed" && ! "$reinstall" = "yes" ]]; then
    show_status "Google Chrome already installed"
else
    get32="https://dl.google.com/linux/direct/google-chrome-stable_current_i386.rpm"
    file32=${get32##*/}
    get64="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
    file64=${get64##*/}
    process_pkg
fi
[[ "$(install_chrome_test)" = "Installed" ]]; exit_state
}

install_chrome_test() {
if [[ -f /opt/google/chrome/google-chrome ]]; then
    printf "Installed"
else
    printf "Not installed"
fi
}
