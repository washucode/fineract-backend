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
package org.apache.fineract.accounting.rule.api;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * Created by sanyam on 26/7/17.
 */
final class AccountingRuleApiResourceSwagger {

    private AccountingRuleApiResourceSwagger() {
        // For Swagger Documentation
    }

    @Schema(description = "PostAccountingRulesResponse")
    public static final class PostAccountingRulesResponse {

        private PostAccountingRulesResponse() {

        }

        @Schema(example = "1")
        public Long officeId;
        @Schema(example = "1")
        public Long resourceId;
    }

    @Schema(description = "PutAccountingRulesResponse")
    public static final class PutAccountingRulesResponse {

        private PutAccountingRulesResponse() {

        }

        public static class PutAccountingRulesResponsechangesSwagger {

            PutAccountingRulesResponsechangesSwagger() {}

            @Schema(example = "Employee Salary posting rule")
            public String name;
        }

        @Schema(example = "1")
        public Long resourceId;
        public PutAccountingRulesResponsechangesSwagger changes;
    }

    @Schema(description = "DeleteAccountingRulesResponse")
    public static final class DeleteAccountingRulesResponse {

        private DeleteAccountingRulesResponse() {

        }

        @Schema(example = "1")
        public Long resourceId;
    }
}
