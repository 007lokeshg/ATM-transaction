# **API Description**

This Example API communicates with _mySql data base_.

This API contain 4 end points.

> - create Account
> - check Balane
> - with draw
> - unBlock

**create Account** : IT tells how to create a Bank account.

**check Balance** : IT tells how to check the balance in Bank account.

**with Draw** : It tells how to with draw amount from the bank account.

**UnBlock**  : It tells to unBlock the ATM Pin from the blocked account.

**Document** : [ATM Transaction Project Document](https://drive.google.com/folderview?id=15xt-ZDDphJc2qskn3aIx3QK9ViF3JyvY) (click here to open the document)

- **POST /createAccount?customerName=Lokesh&bank=AXIS&types=savings&branchName=ramnagar**                                              – create an account
- **POST /withDraw?bank=AXIS&types=savings**             – with draw amount from the account
- **POST /checkBalance?bank=AXIS&types=savings**        – check how much amount is there in the account 
- **PUT /unBlock**                – unblock the blocked account

# **Design of this api** : [click here for the ATM Transaction RAML](https://anypoint.mulesoft.com/exchange/portals/tavant-technologies-81/7d966827-598f-4224-86f6-1b6c1378d189/mulesoft-atm-transaction-lokeshgundlapalli/)

 
   > - **bank**                : enum Values(fixes values)
         ```
         - AXIS
         - ICIC
         - HDFC
         ```
   > - **types**                : enum Values(fixes values)
           ```
           - savings
           - current
            ```
   > - **customerName**         : min = 4 & max = 45
   > - **branchName**           : min = 4 & max = 10
   > - **accountNum*            : (min & max) = 10
   > - **atmPin**               : (min & max) = 4  [**note**: pass number as string]()
   > - **ifscCode**             : min = 4 max = 10  
   > - **depositAmount**        : it should be number
   > - **mailId**               : string
   > - **contact**              : string
   > - **amountToBeWithdraw**   : it should be number
   > - **user**                 : with default value “admin”
   > - **password**             : with default value “admin”

# **Here is the  _**POST MAN  collection**_**

### **Post create Account**:

[http://127.0.0.1:8082/api/createAccount?customerName=Lokesh&bank=AXIS&types=savings&branchName=ramnagar](http://127.0.0.1:8082/api/createAccount?customerName=Lokesh&bank=AXIS&types=savings&branchName=ramnagar)

**body:**

```
 {
   "accountNum": "8331943046",
   "atmPin": "1234",
   "ifscCode": "sbin209992",
   "depositAmount": "100000",
   "mailId": "007lokeshg@gmail.com",
   "contact": "8331943046"
}
```

### **Post check balance**:

[http://127.0.0.1:8082/api/checkBalance?bank=AXIS&types=savings](http://127.0.0.1:8082/api/checkBalance?bank=AXIS&types=savings)

**body**:

```
{
  "accountNum": "9581585591",
  "atmPin": "1234"
}
```

### **Post withdraw**:

[http://127.0.0.1:8082/api/withDraw?bank=AXIS&types=savings](http://127.0.0.1:8082/api/withDraw?bank=AXIS&types=savings)

 **body**:

```
 {
  "accountNum": "9581585591",
  "atmPin": "1264",
  "ammountToWithdraw": 200
}
```

### **Put unlock**:

[http://127.0.0.1:8082/api/unblock](http://127.0.0.1:8082/api/unblock)

**body**:

```
{
  "user": "admin",
  "password": "admin",
  "accountNum": "9581585591",
  "bank": "AXIS"
}
```

**In this project Insted of using Choice router. I have used Dynamic variable using pattern matching** 

#### Note : 
 1. Enter wrong pin and try for three times.
 2. Enter in-correct Account number and try.
 3. Enter more ammount than the depoisted and try.



![resources/Tavant_Logo-66629037-0590-4872-abfc-430131de05e7.jpg](resources/Tavant_Logo-66629037-0590-4872-abfc-430131de05e7.jpg)
