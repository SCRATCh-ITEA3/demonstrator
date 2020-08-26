cppcheck --enable=all --xml --xml-version=2 ../src 2> report.xml
cppcheck-htmlreport --report-dir html-report --source-dir ../src --file report.xml
