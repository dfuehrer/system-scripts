#!/usr/bin/awk -f

BEGIN {
    OFS = ","
    start = 0
}

match($0, "Date:\\s*(.*)$", match_arr) {
    date = "\"" match_arr[1] "\""
}

/Item Details/ {
    start = 1
    # set sale value to 0 moneys
    sale_amount = "$0.00"
    print "\"Name\"", "\"Size\"", "\"Total Cost\"", "\"Quantity\"", "\"Item Cost\"", "\"Original Item Cost\"", "\"Sale\"", "\"UPC\"", "\"Date\""
    next
}
start == 0 {
    next
}

match($0, "^(.*),\\s*([^,]*)$", match_arr) {

    name = "\"" match_arr[1] "\""
    size = "\"" match_arr[2] "\""
}
/^\$[[:digit:]]*(\.[[:digit:]]*)?$/ {
    #moneys = substr($0, 2)
    moneys = $1
}
match($0, "^([[:digit:]]+(\\.[[:digit:]]*)?\\s*[[:alpha:]]*)\\s+x\\s+(\\$[[:digit:]]*(\\.[[:digit:]]*)?)\\s*(\\$([[:digit:]]*(\\.[[:digit:]]*)?))?", match_arr) {
    amount = match_arr[1]
    per_cost = match_arr[3]
    orig_per_cost = match_arr[5]
    if ( orig_per_cost == "" ) {
        orig_per_cost = per_cost
    }
}
match($0, "Sale:\\s*.?(\\$[[:digit:]]*(\\.[[:digit:]]*)?)", match_arr) {
    sale_amount = match_arr[1]
}
match($0, "^UPC:\\s*([[:digit:]]+)$", match_arr) {
    upc = match_arr[1]
}

/Payment Details/ {
    exit
}

# TODO are these the things that matter?
name != "" && moneys != "" && per_cost != "" && upc != "" {
    print name, size, moneys, amount, per_cost, orig_per_cost, sale_amount, upc, date

    name = ""
    size = ""
    moneys = ""
    amount = ""
    per_cost = ""
    orig_per_cost = ""
    sale_amount = "$0.00"
    upc = ""
}
