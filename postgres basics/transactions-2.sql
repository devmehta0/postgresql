-- select
SELECT * FROM accounts;
-- Commit
BEGIN;
	-- Alice to bob
	UPDATE accounts
	SET balance = balance - 1000
	WHERE id = 1;
	
	UPDATE accounts
	SET balance = balance + 1000
	WHERE id = 2; 
	
COMMIT;

-- Rollback 
INSERT INTO accounts(name, balance)
VALUES('Jack',0);

-- Alice to bob
BEGIN;
	UPDATE accounts
	SET balance = balance -1500
	WHERE id = 2;

	UPDATE accounts
	SET balance = balance + 1000
	WHERE id = 1;

	ROLLBACK;

-- Savepoint practice

BEGIN;
	INSERT INTO accounts(name, balance)
	VALUES('D',5000);
	
	SAVEPOINT my_sp;
	
	INSERT INTO accounts(name, balance)
	VALUES('E', 5000);
	
	
	ROLLBACK TO my_sp;
	
end;
