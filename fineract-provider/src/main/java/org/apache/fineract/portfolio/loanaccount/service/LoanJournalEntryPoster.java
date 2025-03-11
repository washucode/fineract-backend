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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.apache.fineract.accounting.journalentry.service.JournalEntryWritePlatformService;
import org.apache.fineract.organisation.monetary.domain.MonetaryCurrency;
import org.apache.fineract.portfolio.loanaccount.domain.Loan;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class LoanJournalEntryPoster {

    private final JournalEntryWritePlatformService journalEntryWritePlatformService;

    public void postJournalEntries(final Loan loan, final List<Long> existingTransactionIds,
            final List<Long> existingReversedTransactionIds) {

        final MonetaryCurrency currency = loan.getCurrency();
        boolean isAccountTransfer = false;
        List<Map<String, Object>> accountingBridgeData = new ArrayList<>();
        if (loan.isChargedOff()) {
            accountingBridgeData = loan.deriveAccountingBridgeDataForChargeOff(currency.getCode(), existingTransactionIds,
                    existingReversedTransactionIds, isAccountTransfer);
        } else {
            accountingBridgeData.add(loan.deriveAccountingBridgeData(currency.getCode(), existingTransactionIds,
                    existingReversedTransactionIds, isAccountTransfer));
        }
        for (Map<String, Object> accountingData : accountingBridgeData) {
            this.journalEntryWritePlatformService.createJournalEntriesForLoan(accountingData);
        }

    }
}
