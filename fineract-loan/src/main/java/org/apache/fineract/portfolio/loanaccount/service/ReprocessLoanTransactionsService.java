/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.apache.fineract.portfolio.loanaccount.service;

import java.time.LocalDate;
import java.util.List;
import org.apache.fineract.portfolio.loanaccount.domain.Loan;
import org.apache.fineract.portfolio.loanaccount.domain.LoanCharge;
import org.apache.fineract.portfolio.loanaccount.domain.LoanTransaction;

public interface ReprocessLoanTransactionsService {

    void reprocessTransactions(Loan loan);

    void reprocessTransactions(Loan loan, List<LoanTransaction> loanTransactions);

    void reprocessTransactionsWithPostTransactionChecks(Loan loan, LocalDate transactionDate);

    void processPostDisbursementTransactions(Loan loan);

    void removeLoanCharge(Loan loan, LoanCharge loanCharge);

    void processLatestTransaction(LoanTransaction loanTransaction, Loan loan);

}
