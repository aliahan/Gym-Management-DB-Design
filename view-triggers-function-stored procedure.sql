--view:
-----------view1
create or ALTER view above50members AS 
select *
from Member
where Member.birthDate<='1972-01-01'



-----------view2
create or ALTER view aboutToEndMembership AS 
select *
from Member
where Member.Member_RemainDays<=5





-----------view3
create or ALTER view coachMemberFullData AS 
select member.MemberID,coach.coachID,Member_LastName,Member_FirstName,coach_LastName,coach_FirstName
from Member inner join coach_member on
Member.MemberID=coach_member.MemberID
inner join coach on
coach.coachID=coach_member.coachID




--fucntion:

--------------func1
CREATE OR ALTER FUNCTION totalpays
 (
 @FromDate AS DATETIME, @ToDate AS DATETIME
 )
RETURNS TABLE
AS
	RETURN
		(
		select SUM(P.payedAmount)  AS total
		from pays AS P
		where P.payDate>=@FromDate AND P.payDate <= @ToDate
	
		
		);
		
 
GO



--------------func2
CREATE OR ALTER FUNCTION coachMemberCounter
 (
 @coachID AS int
 )
RETURNS TABLE
AS
	RETURN
		(
		select count(*) AS totalmember  
		from coach_member AS cm
		where cm.coachID=@coachID
	
		
		);
		
 
GO


--------------func3
CREATE OR ALTER FUNCTION RemainSessions
 (
 @MemberID AS int
 )
RETURNS TABLE
AS
	RETURN
		(
		select m.MemberID,m.Member_FirstName,m.Member_LastName,m.Member_RemainDays  
		from Member AS m
		where m.MemberID=@MemberID
	
		
		);
		
 
GO

---stored procedure:


----------------------------------------------proc1
Create or alter procedure signUpMember
(
	@MemberID	        int,
	@Member_LastName	varchar(255),
	@Member_FirstName	varchar(255),
	@Member_Phonenum    varchar(255),
	@Member_SignupDate  DATETIME ,
	@Address			varchar(255),
    @City				varchar(255),
	@birthDate			DATETIME,
	@Member_RemainDays	int,
	@Member_MemberShipType int,
	@EnterID             int
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM [Member]
    WHERE Member.MemberID=@MemberID
	)
    BEGIN
        UPDATE [Member] SET 
	       MemberID=@MemberID,
		   Member_FirstName = @Member_FirstName,
	       Member_LastName = @Member_LastName,
		   Member_Phonenum=@Member_Phonenum ,
		   Member_SignupDate=@Member_SignupDate ,
		   Address=@Address,
		   City= @City,
		   birthDate=@birthDate,
		   Member_RemainDays=@Member_RemainDays,
		   Member_MemberShipType=@Member_MemberShipType,
		   EnterID=@EnterID
	     
	       WHERE Member.MemberID=@MemberID
		   
		UPDATE [Membership_mangment] SET
			MemberId=@MemberID,
			MemberShipID=@Member_MemberShipType,
			RemainSession=@Member_RemainDays

			WHERE [Membership_mangment].MemberID=@MemberID
		
		
	PRINT 'Customer Data Updated'
    END
ELSE
    BEGIN
        INSERT INTO [Member] VALUES (@MemberID,@Member_LastName,@Member_FirstName,@Member_Phonenum,@Member_SignupDate,@Address,@City,@birthDate,
		@Member_RemainDays,@Member_MemberShipType,@EnterID)
		INSERT INTO [Membership_mangment] VALUES (@MemberID,@Member_MemberShipType,@Member_RemainDays)
		
		
	PRINT 'New Customer Data Inserted'
    END
END

----------------------------------------------proc2
Create or alter procedure coachMemberContract
(
	@id					int,
	@coachID			int,
	@MemberID	        int,
	@EnterId 			int,
	@contract_type		varchar(255),
	@contract_startDate DATETIME,
	@contract_expireDate DATETIME


)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM [coach_member]
    WHERE coach_member.MemberID=@MemberID and coach_member.coachID=@coachID
	)
    BEGIN
        UPDATE [coach_member] SET 
	       Id=@id,
		   coachID =@coachID,
		   MemberID = @MemberID,
		   EnterID  =@EnterID,
		   contract_type =@contract_type,
		   contract_startDate =@contract_startDate,
		   contract_expireDate =@contract_expireDate


	     
	        WHERE coach_member.MemberID=@MemberID and coach_member.coachID=@coachID
	
		
		
	PRINT 'COACH_MEMBER Data Updated'
    END
ELSE
    BEGIN
        INSERT INTO [coach_member] VALUES (@id,@coachID,@MemberID,@EnterID,@contract_type,@contract_startDate,@contract_expireDate)
		
	
		
		
	PRINT 'New COACH_MEMBER Data Inserted'
    END
END




----------------------------------------------proc3
Create or alter procedure pay
(
	@id					int,
	@MemberID	        int,
	@payedAmount		int,
	@payDate			Date,
	@MemberShipID       int


)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM [pays]
    WHERE pays.payID=@id and pays.MemberID=@MemberID
	)
    BEGIN
        UPDATE [pays] SET 
			payID=@id,
			MemberID=@MemberID,
			payedAmount=@payedAmount,
			payDate=@payDate
	        WHERE pays.payID=@id and pays.MemberID=@MemberID
		UPDATE [Member] SET 
			Member_MemberShipType=@MemberShipID,
			Member_RemainDays=(select MemberShipPeriod from MemberShips as M where m.MemberShipID=@MemberShipID)
			WHERE Member.MemberID=@MemberID
	
		
		
	PRINT 'pays Data Updated'
    END
ELSE
    BEGIN
        INSERT INTO [pays] VALUES (@id,@MemberID,@payedAmount,@payDate)
		UPDATE [Member] SET 
			Member_MemberShipType=@MemberShipID,
			Member_RemainDays=(select MemberShipPeriod from MemberShips as M where m.MemberShipID=@MemberShipID)
			WHERE Member.MemberID=@MemberID
		
	
		
		
	PRINT 'New pays Data Inserted'
    END
END



----------------------------------------------proc4
Create or alter procedure EnterExit_proc
(
	
	@EnterID			int,
	@MemberID	        int,
	@closetID			int,
	@enterDate			Date,
	@exitDate       	Date


)
AS
BEGIN
declare @FirstEmptyCloset   int,@counter int

SET @counter=1
WHILE(@counter<100)
BEGIN
	SELECT @FirstEmptyCloset=closetID
	FROM closet
	WHERE empety_statue=1 and usable_statue=1
	SET @Counter  = @Counter  + 1
	
	


END
    IF EXISTS (SELECT 1 FROM [EnterExit]
	WHERE EnterExit.EnterID=@EnterID
    
	)
    BEGIN
        UPDATE [EnterExit] SET 
			exitDate=getdate()
	        WHERE EnterExit.EnterID=@EnterID
	

			
	
		
		
	PRINT 'Member Exited'
    END
ELSE
    BEGIN
        INSERT INTO [EnterExit] VALUES (@EnterID,@MemberID,@FirstEmptyCloset,@enterDate,@exitDate)
		UPDATE [closet] SET 
			closet.empety_statue=0
			WHERE  closet.closetID=@FirstEmptyCloset
		
	
		
		
	PRINT 'Member entered!!!'
    END
END





---TRIGGERS:


----------------------------------------------TRIGGER1
Create or alter trigger enter_exit_trigger
on [Gym_Managment].[dbo].[EnterExit]
after insert
AS
BEGIN
	declare @MemberId int;
	declare @EnterId int;
	select @MemberId=MemberID,@EnterId=EnterID
	from EnterExit
	update Member 
	set Member_RemainDays=Member_RemainDays-1,EnterId=@EnterId

	where Member.MemberID=@MemberId
	

END





----------------------------------------------TRIGGER2


Create or alter trigger coachInserttrigger
on [Gym_Managment].[dbo].[coach] 
after insert
AS 
BEGIN
	
	declare @coachID int ;
    declare @coach_LastName varchar(255) ;
    declare @coach_FirstName varchar(255);
	declare @coach_Phonenum varchar(255) ;
	declare @coach_SignupDate DATETIME ;
    declare @Address varchar(255) ;
    declare @City varchar(255) ;
	declare @salary int ;
	declare @birthDate DATETIME;


	select @coachID=coachID,@coach_LastName=coach_LastName,@coach_FirstName=coach_FirstName,@coach_Phonenum=coach_Phonenum,@coach_SignupDate=coach_SignupDate
	,@Address=Address,@City=City,@salary=salary,@birthDate=birthDate
	from coach
	INSERT INTO staff VALUES 
	(@coachID,@coach_LastName,@coach_FirstName,@coach_Phonenum,@coach_SignupDate,@Address,@City,@salary,@birthDate);

		
END;







----------------------------------------------TRIGGER3

Create or alter trigger enter_exit_closet_trigger
on [Gym_Managment].[dbo].[EnterExit]
after insert
AS
BEGIN
	declare @closetID int;
	select @closetID=closetID
	from EnterExit
	update closet 
	set empety_statue=0
	where closet.closetID=@closetID
	


END
----------------------------------------------TRIGGER4
Create or alter trigger exit_trigger
on [Gym_Managment].[dbo].[EnterExit]
after update
AS
if update (exitDate)
BEGIN
	declare @closetID int;
	declare @EnterId int;
	select @closetID=closetID,@EnterId=EnterID
	from EnterExit
	update closet 
	set empety_statue=1
	where closet.closetID=@closetID;


END