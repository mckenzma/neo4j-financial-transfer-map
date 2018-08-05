// cypher file to create financial map

// create institutions
CREATE (income1:Income {name: "Income 1", type: "Income", value: 0.0}), 
	   (bank1:Institution {name: "Bank 1", type: "Bank"}), 
	   (bank2:Institution {name: "Bank 2", type: "Bank"}), 
	   (bank3:Institution {name: "Bank 3", type: "Bank"}), 
	   (bank4:Institution {name: "Bank 4", type: "Bank"}), 
	   (bank5:Institution {name: "Bank 5", type: "Bank"}), 
	   (loanprov1:Institution {name: "Loan Provider 1", type: "Loan Provider"}), 
	   (loanprov2:Institution {name: "Loan Provider 2", type: "Loan Provider"}), 
	   (loanprov3:Institution {name: "Loan Provider 3", type: "Loan Provider"}), 
	   (loanprov4:Institution {name: "Loan Provider 4", type: "Loan Provider"}), 
	   (loanprov5:Institution {name: "Loan Provider 5", type: "Loan Provider"}), 
// create accounts
	   (bank1account1:Account {name: "Bank 1 Account 1", type: "Checking", value: 0.0}), 
	   (bank1account2:Account {name: "Bank 1 Account 2", type: "Savings", value: 0.0}), 
	   (bank1account3:Account {name: "Bank 1 Account 3", type: "Credit Card", value: 0.0}), 
	   (bank2account1:Account {name: "Bank 2 Account 1", type: "Checking", value: 0.0}), 
	   (bank2account2:Account {name: "Bank 2 Account 2", type: "Credit Card", value: 0.0}), 
	   (bank2account3:Account {name: "Bank 2 Account 3", type: "Credit Card", value: 0.0}), 
	   (bank3account1:Account {name: "Bank 3 Account 1", type: "Savings", value: 0.0}), 
	   (bank4account1:Account {name: "Bank 4 Account 1", type: "Savings", value: 0.0}), 
	   (bank5account1:Account {name: "Bank 5 Account 1", type: "Checking", value: 0.0}), 
	   (bank5account2:Account {name: "Bank 5 Account 2", type: "Savings", value: 0.0}), 
	   (loanprov1account1:Account {name: "Loan Provider 1 Account 1", type: "Loan", value: 0.0}), 
	   (loanprov2account1:Account {name: "Loan Provider 2 Account 1", type: "Loan", value: 0.0}), 
	   (loanprov2account2:Account {name: "Loan Provider 2 Account 2", type: "Loan", value: 0.0}), 
	   (loanprov2account3:Account {name: "Loan Provider 2 Account 3", type: "Loan", value: 0.0}), 
	   (loanprov2account4:Account {name: "Loan Provider 2 Account 4", type: "Loan", value: 0.0}), 
	   (loanprov2account5:Account {name: "Loan Provider 2 Account 5", type: "Loan", value: 0.0}), 
	   (loanprov3account1:Account {name: "Loan Provider 3 Account 1", type: "Loan", value: 0.0}), 
	   (loanprov4account1:Account {name: "Loan Provider 4 Account 1", type: "Loan", value: 0.0}), 
	   (loanprov5account1:Account {name: "Loan Provider 5 Account 1 (Other)", type: "Loan", value: 0.0}), 
// create bills
		//(bill1:Bill {name: "", value: ""}),
		//(bill2:Bill {name: "", value: ""}),
		//(bill3:Bill {name: "", value: ""}),
// link accounts to institutions
	   (bank1account1)-[:ACCOUNT_OF]->(bank1),
	   (bank1account2)-[:ACCOUNT_OF]->(bank1),
	   (bank1account3)-[:ACCOUNT_OF]->(bank1),
	   (bank2account1)-[:ACCOUNT_OF]->(bank2),
	   (bank2account2)-[:ACCOUNT_OF]->(bank2),
	   (bank2account3)-[:ACCOUNT_OF]->(bank2),
	   (bank3account1)-[:ACCOUNT_OF]->(bank3),
	   (bank4account1)-[:ACCOUNT_OF]->(bank4),
	   (bank5account1)-[:ACCOUNT_OF]->(bank5),
	   (bank5account2)-[:ACCOUNT_OF]->(bank5),
	   (loanprov1account1)-[:ACCOUNT_OF]->(loanprov1),
	   (loanprov2account1)-[:ACCOUNT_OF]->(loanprov2),
	   (loanprov2account2)-[:ACCOUNT_OF]->(loanprov2),
	   (loanprov2account3)-[:ACCOUNT_OF]->(loanprov2),
	   (loanprov2account4)-[:ACCOUNT_OF]->(loanprov2),
	   (loanprov2account5)-[:ACCOUNT_OF]->(loanprov2),
	   (loanprov3account1)-[:ACCOUNT_OF]->(loanprov3),
	   (loanprov4account1)-[:ACCOUNT_OF]->(loanprov4),
	   (loanprov5account1)-[:ACCOUNT_OF]->(loanprov5),
// link transfers between accounts
	   (income1)-[:TRANSFER {value: 1000.0}]->(bank1account1), 
	   (bank1account1)-[:TRANSFER {value: 50.0}]->(bank1account2), 
	   (bank1account1)-[:TRANSFER {value: 51.0}]->(bank3account1), 
	   (bank3account1)-[:TRANSFER {value: 52.0}]->(bank2account1), 
	   (bank3account1)-[:TRANSFER {value: 53.0}]->(bank5account1), 
	   (bank5account1)-[:TRANSFER {value: 54.0}]->(bank5account2), 
	   (bank3account1)-[:TRANSFER {value: 55.0}]->(bank4account1), 
	   (bank2account1)-[:TRANSFER {value: 56.0}]->(loanprov1account1),
	   (bank2account1)-[:TRANSFER {value: 57.0}]->(loanprov2account1),
	   (bank2account1)-[:TRANSFER {value: 58.0}]->(loanprov2account2),
	   (bank2account1)-[:TRANSFER {value: 59.0}]->(loanprov2account3),
	   (bank2account1)-[:TRANSFER {value: 60.0}]->(loanprov2account4),
	   (bank2account1)-[:TRANSFER {value: 59.0}]->(loanprov2account5),
	   (bank2account1)-[:TRANSFER {value: 58.0}]->(loanprov3account1),
	   (bank2account1)-[:TRANSFER {value: 57.0}]->(loanprov4account1),
	   (bank2account1)-[:TRANSFER {value: 56.0}]->(loanprov5account1)

// update (:Account) and (:Income) nodes based on difference of sum of incoming and outgoing transfers
MATCH (m)-[r3:TRANSFER]->()
WITH m, sum(r3.value) AS sum_r3
MATCH ()-[r4:TRANSFER]->(o)
WITH m, sum_r3, o, sum(r4.value) AS sum_r4
MATCH ()-[r1:TRANSFER]->(n)
WITH m, sum_r3, o, sum_r4, n,  sum(r1.value) AS sum_r1
MATCH (n)-[r2:TRANSFER]->()
WITH m, sum_r3, o, sum_r4, n, sum_r1, sum(r2.value) AS sum_r2
SET m.value = sum_r3
SET o.value = sum_r4
SET n.value = sum_r1 - sum_r2
//RETURN n.name, 
//       n.value AS Value, // same as the difference
//      sum_r1 AS Incoming,
//      sum_r2 AS Outgoing
//ORDER BY n.name
