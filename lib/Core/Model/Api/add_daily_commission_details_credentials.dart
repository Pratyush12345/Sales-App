 class AddDailyCommissionDetailCredentials{
   String accountId;
   String fromDate;
   String toDate;
   String currentWeekMonthFlag;
   String fuelType;
   String commissionType;


   AddDailyCommissionDetailCredentials({
     this.accountId,
     this.fromDate,this.toDate,this.currentWeekMonthFlag,this.fuelType,this.commissionType
   });

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['AccountId'] = this.accountId;
     data['FromDate'] = this.fromDate;
     data['ToDate']=this.toDate;
     data['currentweekmonthflag']=this.currentWeekMonthFlag;
     data['Fueltype']=this.fuelType;
     data['Commissiontype']=this.commissionType;
     return data;
   }
 }