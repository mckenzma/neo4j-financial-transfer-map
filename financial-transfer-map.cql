// cypher file to create financial map

// create institutions
CREATE (bank1:Institution {name: "Bank 1", type: "Bank"}),
	   (bank2:Institution {name: "Bank 2", type: "Bank"}),
	   (bank3:Institution {name: "Bank 3", type: "Bank"}),
	   (loanprov1:Institution {name: "Loan Provider 1", type: "Loan Provider"}),
	   (loanprov2:Institution {name: "Load Provider 2", type: "Loan Provider"}),
// create accounts
	   (bank1account1:Account {name: "Bank 1 Account 1", type: "Checking"}),
	   (bank1account2:Account {name: "Bank 1 Account 2", type: "Savings"}),
	   (bank1account3:Account {name: "Bank 1 Account 3", type: "Credit Card"}),
	   (bank2account1:Account {name: "Bank 2 Account 1", type: "Checking"}),
	   (bank2account2:Account {name: "Bank 2 Account 2", type: "Credit Card"}),
	   (bank3account1:Account {name: "Bank 3 Account 1", type: "Savings"}),
	   (loanprov1account1:Account {name: "Loan Provider 1 Account 1", type: "Loan"}),
	   (loanprov1account2:Account {name: "Loan Provider 1 Account 2", type: "Loan"}),
	   (loanprov2account1:Account {name: "Loan Provider 2 Account 1", type: "Loan"}),
// link accounts to institutions
	   (bank1account1)-[:ACCOUNT_OF]->(bank1),
	   (bank1account2)-[:ACCOUNT_OF]->(bank1),
	   (bank1account3)-[:ACCOUNT_OF]->(bank1),
	   (bank2account1)-[:ACCOUNT_OF]->(bank2),
	   (bank2account2)-[:ACCOUNT_OF]->(bank2),
	   (bank3account1)-[:ACCOUNT_OF]->(bank3),
	   (loanprov1account1)-[:ACCOUNT_OF]->(loanprov1),
	   (loanprov1account2)-[:ACCOUNT_OF]->(loanprov1),
	   (loanprov2account1)-[:ACCOUNT_OF]->(loanprov2)