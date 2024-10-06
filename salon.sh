#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Shop ~~~~~\n"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "How may I help you?" 
  echo -e "\n1) Cutting \n2) Washing \n3) Complete"
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]+$ ]]
  then
    MAIN_MENU "Please enter a valid request"
  else
    echo -e "\n Please provide a phone number:"
    read CUSTOMER_PHONE
    if [[ -z $CUSTOMER_PHONE ]]
    then
    MAIN_MENU "ENTER VALID PHONE NUMBER"
    else
      CHECK_PHONE_NUMBER=$($PSQL "SELECT phone FROM CUSTOMERS WHERE phone = '$CUSTOMER_PHONE' ")
        if [[ -z $CHECK_PHONE_NUMBER ]]
        then
        echo -e "\nWhat is your name?"
        read CUSTOMER_NAME
          if [[ -z $CUSTOMER_NAME ]]
          then
            MAIN_MENU "ENTER VALID CORRECT CUSTOMER NAME"
          fi
      ENTER_CUSTOMER_INFO=$($PSQL "INSERT INTO CUSTOMERS(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
        
        fi
        echo -e "\nWhat time do you want your appointment to be?"
        read SERVICE_TIME
          if [[ -z $SERVICE_TIME ]]
          then
          MAIN_MENU "ENTER CORRECT SERVICE TIME"
          else
        GET_CUSTOMER_ID=$($PSQL "SELECT CUSTOMER_ID FROM CUSTOMERs WHERE PHONE = '$CUSTOMER_PHONE'")
        ENTER_APPOINTMENT=$($PSQL "INSERT INTO APPOINTMENTS(CUSTOMER_ID,TIME,SERVICE_ID) VALUES ('$GET_CUSTOMER_ID','$SERVICE_TIME','$SERVICE_ID_SELECTED')")
        GET_SERVICE=$($PSQL"SELECT NAME FROM SERVICES WHERE SERVICE_ID = $SERVICE_ID_SELECTED ")
        GET_NAME=$($PSQL"SELECT NAME FROM CUSTOMERS WHERE CUSTOMER_ID = $GET_CUSTOMER_ID")
        echo -e "\nI have put you down for a $(echo $GET_SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $GET_NAME | sed -r 's/^ *| *$//g')."

      
          fi
          

        

        
    fi

  fi






}
MAIN_MENU
