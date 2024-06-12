#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU () {
  if [[ $1 ]]
  then
    echo $1
  fi
  echo Welcome! How can I  help you?
  echo -e "\n1) cut\n2) color\n3) style"
  read SERVICE_ID_SELECTED
  
case $SERVICE_ID_SELECTED in
  1) CUT ;;
  2) COLOR ;;
  3) STYLE ;;
  *) MAIN_MENU 'your input is not valid' ;;
esac
}

CUT () {
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  echo Please input your phone number
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo I don't have record your phone number, what's your name?
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like to $SERVICE_NAME,$CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values ($CUSTOMER_ID,1,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
}

COLOR () {
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  echo Please input your phone number
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo I don't have record your phone number, what's your name?
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like to$SERVICE_NAME,$CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values ($CUSTOMER_ID,1,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
}

STYLE () {
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  echo Please input your phone number
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo I don't have record your phone number, what's your name?
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like to$SERVICE_NAME,$CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values ($CUSTOMER_ID,1,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
}
MAIN_MENU