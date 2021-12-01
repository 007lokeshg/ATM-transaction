%dw 2.0
output application/json skipNullOn="everywhere"
var bank={
    (check:(attributes.queryParams.bank) )if (attributes.queryParams.bank != null),
    (check:(payload.bank)) if (payload.accountNum !=null)
}
---
{
	custName : attributes.queryParams.customerName,
	custAccNum : payload.accountNum,
	atmPin : payload.atmPin,
	bankName : bank.check,
	accountType : attributes.queryParams.types,
	ifscCode : payload.ifscCode,
	branchName: attributes.queryParams.branchName,
	totalBalance: payload.depositAmount default 0,
	transactionTimeStamp : now(),
	mailId : payload.mailId,
	phoneNumber : payload.contact	
}