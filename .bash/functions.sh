# Test Functions
# Example use: `browsertests chrome TestFileCest:testFunctionName`
browsertests() {
    if [ -z "$2" ]; then
        tests="acceptance";
    else
        tests="tests/acceptance/$2";
    fi
    # Launch the Selenium Server on the local machine
    /usr/bin/java -Dwebdriver.chrome.driver=lib/vendor/chromedriver -jar lib/vendor/managed-packages/netwing/selenium-server-standalone/selenium-server-standalone.jar > tests/results/functional/selenium.log 2>&1 &
    # Delete any failure output files from a previous run
    rm -f tests/_output/*.fail.*
    # Wait for the Selenium server to finish its spin-up
    sleep 1
    # Run the tests
    command="php lib/vendor/managed-packages/bin/codecept run $tests --env $1"
    echo "$command"
    $command
    # Wait for the test harness to finish what it's doing
    sleep 1
    # Terminate the Selenium Server launched earlier
    kill -HUP `ps ax | grep '[s]elenium-server-standalone' | awk '{print $1}'`
}
