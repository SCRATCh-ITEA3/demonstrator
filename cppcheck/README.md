# cppcheck static code analysis

To perform static code analysis with cppcheck

## Installation

### With apt packet manager (Debian)

Install cppcheck and utilities

```
apt install cppcheck cppcheck-gui
```


## Running the check

### From command line

For continuous delivery, we 
 provide a script to run the check

```
bash ./cppcheck.sh
```

The script generates a report file and html output. The html output can be feed back to
Jenkins, e.g., with publishHTML plugin.

### Viewing the results

The script generates a html report in `html-report/index.html`.

### Using the GUI

Run

```
cppcheck-gui
```
and open `demo.cppcheck` project configuration.

## TODO

* Include Misra checks
* Extend tests.




