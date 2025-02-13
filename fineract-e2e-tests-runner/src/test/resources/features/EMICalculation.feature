@Emi
Feature: EMI calculation and repayment schedule checks for interest bearing loans

  @TestRailId:C3152
  Scenario: EMI calculation with Actual/Actual setup - integer
    When Admin sets the business date to "12 December 2023"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL | 12 December 2023  | 10000          | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "12 December 2023" with "10000" amount and expected disbursement date on "12 December 2023"
    When Admin successfully disburse the loan on "12 December 2023" with "10000" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 12 December 2023 |           | 10000.0         |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 12 January 2024  |           | 8376.25         | 1623.75       | 101.81   | 0.0  | 0.0       | 1725.56 | 0.0  | 0.0        | 0.0  | 1725.56     |
      | 2  | 31   | 12 February 2024 |           | 6735.83         | 1640.42       | 85.14    | 0.0  | 0.0       | 1725.56 | 0.0  | 0.0        | 0.0  | 1725.56     |
      | 3  | 29   | 12 March 2024    |           | 5074.32         | 1661.51       | 64.05    | 0.0  | 0.0       | 1725.56 | 0.0  | 0.0        | 0.0  | 1725.56     |
      | 4  | 31   | 12 April 2024    |           | 3400.34         | 1673.98       | 51.58    | 0.0  | 0.0       | 1725.56 | 0.0  | 0.0        | 0.0  | 1725.56     |
      | 5  | 30   | 12 May 2024      |           | 1708.23         | 1692.11       | 33.45    | 0.0  | 0.0       | 1725.56 | 0.0  | 0.0        | 0.0  | 1725.56     |
      | 6  | 31   | 12 June 2024     |           | 0.0             | 1708.23       | 17.36    | 0.0  | 0.0       | 1725.59 | 0.0  | 0.0        | 0.0  | 1725.59     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      | 10000.0       | 353.39   | 0.0  | 0.0       | 10353.39 | 0.0  | 0.0        | 0.0  | 10353.39    |

  @TestRailId:C3153
  Scenario: EMI calculation with Actual/Actual setup - decimal
    When Admin sets the business date to "12 December 2023"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL | 12 December 2023  | 10000          | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "12 December 2023" with "10000" amount and expected disbursement date on "12 December 2023"
    When Admin successfully disburse the loan on "12 December 2023" with "10000" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 12 December 2023 |           | 10000.0         |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 12 January 2024  |           | 8367.33         | 1632.67       | 80.45    | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 2  | 31   | 12 February 2024 |           | 6721.41         | 1645.92       | 67.2     | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 3  | 29   | 12 March 2024    |           | 5058.79         | 1662.62       | 50.5     | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 4  | 31   | 12 April 2024    |           | 3386.3          | 1672.49       | 40.63    | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 5  | 30   | 12 May 2024      |           | 1699.5          | 1686.8        | 26.32    | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 6  | 31   | 12 June 2024     |           | 0.0             | 1699.5        | 13.65    | 0.0  | 0.0       | 1713.15 | 0.0  | 0.0        | 0.0  | 1713.15     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      | 10000.0       | 278.75   | 0.0  | 0.0       | 10278.75 | 0.0  | 0.0        | 0.0  | 10278.75    |

  @TestRailId:C3164 @ActualActualIterate @iterate
  Scenario: EMI calculation with Actual/Actual setup - decimal - iterate
    When Admin sets the business date to "12 December 2023"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL | 12 December 2023  | 331.77         | 10.65                  | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 5                 | MONTHS                | 1              | MONTHS                 | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "12 December 2023" with "331.77" amount and expected disbursement date on "12 December 2023"
    When Admin successfully disburse the loan on "12 December 2023" with "331.77" EUR transaction amount
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 12 December 2023 |           | 331.77          |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 12 January 2024  |           | 266.63          | 65.14         | 3.0      | 0.0  | 0.0       | 68.14 | 0.0  | 0.0        | 0.0  | 68.14       |
      | 2  | 31   | 12 February 2024 |           | 200.9           | 65.73         | 2.41     | 0.0  | 0.0       | 68.14 | 0.0  | 0.0        | 0.0  | 68.14       |
      | 3  | 29   | 12 March 2024    |           | 134.46          | 66.44         | 1.7      | 0.0  | 0.0       | 68.14 | 0.0  | 0.0        | 0.0  | 68.14       |
      | 4  | 31   | 12 April 2024    |           | 67.53           | 66.93         | 1.21     | 0.0  | 0.0       | 68.14 | 0.0  | 0.0        | 0.0  | 68.14       |
      | 5  | 30   | 12 May 2024      |           | 0.0             | 67.53         | 0.59     | 0.0  | 0.0       | 68.12 | 0.0  | 0.0        | 0.0  | 68.12       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 331.77        | 8.91     | 0.0  | 0.0       | 340.68 | 0.0  | 0.0        | 0.0  | 340.68      |

  @TestRailId:C3154
  Scenario: EMI calculation with 360/30 setup - integer
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 1 January 2024    | 100            | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.75           | 16.25         | 1.0      | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 2  | 29   | 01 March 2024    |           | 67.34           | 16.41         | 0.84     | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 3  | 31   | 01 April 2024    |           | 50.76           | 16.58         | 0.67     | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 4  | 30   | 01 May 2024      |           | 34.02           | 16.74         | 0.51     | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 5  | 31   | 01 June 2024     |           | 17.11           | 16.91         | 0.34     | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.11         | 0.17     | 0.0  | 0.0       | 17.28 | 0.0  | 0.0        | 0.0  | 17.28       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 3.53     | 0.0  | 0.0       | 103.53 | 0.0  | 0.0        | 0.0  | 103.53      |

  @TestRailId:C3155
  Scenario: EMI calculation with 360/30 setup - decimal
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 1 January 2024    | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |

  @TestRailId:C3165 @36030Iterate @iterate
  Scenario: EMI calculation with 360/30 setup - decimal - iterate
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 1 January 2024    | 75             | 12.3                   | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 5                 | MONTHS                | 1              | MONTHS                 | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "75" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "75" EUR transaction amount
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 75.0            |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 60.3            | 14.7          | 0.77     | 0.0  | 0.0       | 15.47 | 0.0  | 0.0        | 0.0  | 15.47       |
      | 2  | 29   | 01 March 2024    |           | 45.45           | 14.85         | 0.62     | 0.0  | 0.0       | 15.47 | 0.0  | 0.0        | 0.0  | 15.47       |
      | 3  | 31   | 01 April 2024    |           | 30.45           | 15.0          | 0.47     | 0.0  | 0.0       | 15.47 | 0.0  | 0.0        | 0.0  | 15.47       |
      | 4  | 30   | 01 May 2024      |           | 15.29           | 15.16         | 0.31     | 0.0  | 0.0       | 15.47 | 0.0  | 0.0        | 0.0  | 15.47       |
      | 5  | 31   | 01 June 2024     |           | 0.0             | 15.29         | 0.16     | 0.0  | 0.0       | 15.45 | 0.0  | 0.0        | 0.0  | 15.45       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 75.0          | 2.33     | 0.0  | 0.0       | 77.33 | 0.0  | 0.0        | 0.0  | 77.33       |

  @TestRailId:C3156 @Skip
  Scenario: EMI calculation with 360/30 setup - decimal - reschedule
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 1 January 2024    | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |
    When Admin sets the business date to "18 February 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate  | adjustedDueDate  | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 01 February 2024   | 18 February 2024 | 18 February 2024 |                  |                 |            | 9.4822          |
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 48   | 18 February 2024 |           | 84.02           | 15.98         | 1.22     | 0.0  | 0.0       | 17.20 | 0.0  | 0.0        | 0.0  | 17.20       |
      | 2  | 29   | 18 March 2024    |           | 67.48           | 16.54         | 0.66     | 0.0  | 0.0       | 17.20 | 0.0  | 0.0        | 0.0  | 17.20       |
      | 3  | 31   | 18 April 2024    |           | 50.81           | 16.67         | 0.53     | 0.0  | 0.0       | 17.20 | 0.0  | 0.0        | 0.0  | 17.20       |
      | 4  | 30   | 18 May 2024      |           | 34.01           | 16.8          | 0.4      | 0.0  | 0.0       | 17.20 | 0.0  | 0.0        | 0.0  | 17.20       |
      | 5  | 31   | 18 June 2024     |           | 17.08           | 16.93         | 0.27     | 0.0  | 0.0       | 17.20 | 0.0  | 0.0        | 0.0  | 17.20       |
      | 6  | 30   | 18 July 2024     |           | 0.0             | 17.08         | 0.13     | 0.0  | 0.0       | 17.21 | 0.0  | 0.0        | 0.0  | 17.21       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 3.21     | 0.0  | 0.0       | 103.21 | 0.0  | 0.0        | 0.0  | 103.21      |

  @TestRailId:C3157
  Scenario: EMI calculation with 360/30 setup - integer - repayment every 2 months
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 1 January 2024    | 100            | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 2              | MONTHS                 | 3                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 3 periods, with the following data for periods:
      | Nr | Days | Date            | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024 |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 60   | 01 March 2024   |           | 67.32           | 32.68         | 2.0      | 0.0  | 0.0       | 34.68 | 0.0  | 0.0        | 0.0  | 34.68       |
      | 2  | 61   | 01 May 2024     |           | 33.99           | 33.33         | 1.35     | 0.0  | 0.0       | 34.68 | 0.0  | 0.0        | 0.0  | 34.68       |
      | 3  | 61   | 01 July 2024    |           | 0.0             | 33.99         | 0.68     | 0.0  | 0.0       | 34.67 | 0.0  | 0.0        | 0.0  | 34.67       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 4.03     | 0.0  | 0.0       | 104.03 | 0.0  | 0.0        | 0.0  | 104.03      |

  @TestRailId:C3158
  Scenario: EMI calculation with 360/30 setup - decimal - repayment every 2 weeks
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 1 January 2024    | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 12                | WEEKS                 | 2              | WEEKS                  | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 14   | 15 January 2024  |           | 83.49           | 16.51         | 0.37     | 0.0  | 0.0       | 16.88 | 0.0  | 0.0        | 0.0  | 16.88       |
      | 2  | 14   | 29 January 2024  |           | 66.92           | 16.57         | 0.31     | 0.0  | 0.0       | 16.88 | 0.0  | 0.0        | 0.0  | 16.88       |
      | 3  | 14   | 12 February 2024 |           | 50.29           | 16.63         | 0.25     | 0.0  | 0.0       | 16.88 | 0.0  | 0.0        | 0.0  | 16.88       |
      | 4  | 14   | 26 February 2024 |           | 33.6            | 16.69         | 0.19     | 0.0  | 0.0       | 16.88 | 0.0  | 0.0        | 0.0  | 16.88       |
      | 5  | 14   | 11 March 2024    |           | 16.84           | 16.76         | 0.12     | 0.0  | 0.0       | 16.88 | 0.0  | 0.0        | 0.0  | 16.88       |
      | 6  | 14   | 25 March 2024    |           | 0.0             | 16.84         | 0.06     | 0.0  | 0.0       | 16.9  | 0.0  | 0.0        | 0.0  | 16.9        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.3      | 0.0  | 0.0       | 101.3 | 0.0  | 0.0        | 0.0  | 101.3       |

  @TestRailId:C3159
  Scenario: EMI calculation with 365/Actual setup - integer
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_365_ACTUAL | 1 January 2024    | 100            | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.77           | 16.23         | 1.02     | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 2  | 29   | 01 March 2024    |           | 67.32           | 16.45         | 0.8      | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 3  | 31   | 01 April 2024    |           | 50.76           | 16.56         | 0.69     | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 4  | 30   | 01 May 2024      |           | 34.01           | 16.75         | 0.5      | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 5  | 31   | 01 June 2024     |           | 17.11           | 16.9          | 0.35     | 0.0  | 0.0       | 17.25 | 0.0  | 0.0        | 0.0  | 17.25       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.11         | 0.17     | 0.0  | 0.0       | 17.28 | 0.0  | 0.0        | 0.0  | 17.28       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 3.53     | 0.0  | 0.0       | 103.53 | 0.0  | 0.0        | 0.0  | 103.53      |

  @TestRailId:C3160
  Scenario: EMI calculation with 365/Actual setup - decimal
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_365_ACTUAL | 1 January 2024    | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.68           | 16.32         | 0.81     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.18           | 16.5          | 0.63     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.59         | 0.54     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.85           | 16.74         | 0.39     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 16.99           | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.99         | 0.13     | 0.0  | 0.0       | 17.12 | 0.0  | 0.0        | 0.0  | 17.12       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.77     | 0.0  | 0.0       | 102.77 | 0.0  | 0.0        | 0.0  | 102.77      |

  @TestRailId:C3161
  Scenario: EMI calculation with 360/30 setup - integer - downpayment
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 1 January 2024    | 100            | 5                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 5                 | MONTHS                | 1              | MONTHS                 | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 31   | 01 February 2024 |           | 60.12           | 14.88         | 0.31     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 3  | 29   | 01 March 2024    |           | 45.18           | 14.94         | 0.25     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 4  | 31   | 01 April 2024    |           | 30.18           | 15.0          | 0.19     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 5  | 30   | 01 May 2024      |           | 15.12           | 15.06         | 0.13     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 6  | 31   | 01 June 2024     |           | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.94     | 0.0  | 0.0       | 100.94 | 0.0  | 0.0        | 0.0  | 100.94      |

  @TestRailId:C3166 @iterate
  Scenario: EMI calculation with 365/Actual setup - decimal - iterate - repayment every 15 days
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_365_ACTUAL | 1 January 2024    | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 90                | DAYS                  | 15             | DAYS                   | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 15   | 16 January 2024  |           | 83.49           | 16.51         | 0.39     | 0.0  | 0.0       | 16.9  | 0.0  | 0.0        | 0.0  | 16.9        |
      | 2  | 15   | 31 January 2024  |           | 66.92           | 16.57         | 0.33     | 0.0  | 0.0       | 16.9  | 0.0  | 0.0        | 0.0  | 16.9        |
      | 3  | 15   | 15 February 2024 |           | 50.28           | 16.64         | 0.26     | 0.0  | 0.0       | 16.9  | 0.0  | 0.0        | 0.0  | 16.9        |
      | 4  | 15   | 01 March 2024    |           | 33.58           | 16.7          | 0.2      | 0.0  | 0.0       | 16.9  | 0.0  | 0.0        | 0.0  | 16.9        |
      | 5  | 15   | 16 March 2024    |           | 16.81           | 16.77         | 0.13     | 0.0  | 0.0       | 16.9  | 0.0  | 0.0        | 0.0  | 16.9        |
      | 6  | 15   | 31 March 2024    |           | 0.0             | 16.81         | 0.07     | 0.0  | 0.0       | 16.88 | 0.0  | 0.0        | 0.0  | 16.88       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.38     | 0.0  | 0.0       | 101.38 | 0.0  | 0.0        | 0.0  | 101.38      |

  @TestRailId:C3167 @365ActualIterate3 @iterate
  Scenario: EMI calculation with 365/Actual setup - decimal - iterate but outcome is false positive, go with original EMI
    When Admin sets the business date to "1 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_365_ACTUAL | 1 January 2024    | 100            | 15.678                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "1 January 2024" with "100" amount and expected disbursement date on "1 January 2024"
    When Admin successfully disburse the loan on "1 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.9            | 16.1          | 1.33     | 0.0  | 0.0       | 17.43 | 0.0  | 0.0        | 0.0  | 17.43       |
      | 2  | 29   | 01 March 2024    |           | 67.52           | 16.38         | 1.05     | 0.0  | 0.0       | 17.43 | 0.0  | 0.0        | 0.0  | 17.43       |
      | 3  | 31   | 01 April 2024    |           | 50.99           | 16.53         | 0.9      | 0.0  | 0.0       | 17.43 | 0.0  | 0.0        | 0.0  | 17.43       |
      | 4  | 30   | 01 May 2024      |           | 34.22           | 16.77         | 0.66     | 0.0  | 0.0       | 17.43 | 0.0  | 0.0        | 0.0  | 17.43       |
      | 5  | 31   | 01 June 2024     |           | 17.25           | 16.97         | 0.46     | 0.0  | 0.0       | 17.43 | 0.0  | 0.0        | 0.0  | 17.43       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.25         | 0.22     | 0.0  | 0.0       | 17.47 | 0.0  | 0.0        | 0.0  | 17.47       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 4.62     | 0.0  | 0.0       | 104.62 | 0.0  | 0.0        | 0.0  | 104.62      |

  @TestRailId:C3194
  Scenario: EMI calculation with 365/30 multidisburse setup - UC1: 2nd disbursement in 1st installment period, no repayment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                           | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 300            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "300" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |
    When Admin sets the business date to "08 January 2024"
    When Admin successfully disburse the loan on "08 January 2024" with "200" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      |    |      | 08 January 2024  |           | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 250.69          | 49.31         | 2.02     | 0.0  | 0.0       | 51.33 | 0.0  | 0.0        | 0.0  | 51.33       |
      | 2  | 29   | 01 March 2024    |           | 201.34          | 49.35         | 1.98     | 0.0  | 0.0       | 51.33 | 0.0  | 0.0        | 0.0  | 51.33       |
      | 3  | 31   | 01 April 2024    |           | 151.6           | 49.74         | 1.59     | 0.0  | 0.0       | 51.33 | 0.0  | 0.0        | 0.0  | 51.33       |
      | 4  | 30   | 01 May 2024      |           | 101.47          | 50.13         | 1.2      | 0.0  | 0.0       | 51.33 | 0.0  | 0.0        | 0.0  | 51.33       |
      | 5  | 31   | 01 June 2024     |           | 50.94           | 50.53         | 0.8      | 0.0  | 0.0       | 51.33 | 0.0  | 0.0        | 0.0  | 51.33       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 50.94         | 0.4      | 0.0  | 0.0       | 51.34 | 0.0  | 0.0        | 0.0  | 51.34       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 300.0         | 7.99     | 0.0  | 0.0       | 307.99 | 0.0  | 0.0        | 0.0  | 307.99      |

#  TODO unskip and check when early repayment for EMI is implemented (PS-2076, PS-1958)
  @Skip @TestRailId:C3195
  Scenario: EMI calculation with 365/30 multidisburse setup - UC2: 1st installment fully repaid early, then 2nd disbursement in 1std installment period, allocation rule: NEXT INSTALLMENT
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                           | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 300            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "300" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#    --- Early full repayment of 1st installment ---
    When Admin sets the business date to "05 January 2024"
    And Customer makes "AUTOPAY" repayment on "05 January 2024" with 17.13 EUR transaction amount
#    Then Loan Repayment schedule has 6 periods, with the following data for periods:
#      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
#      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
#      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
#      | 2  | 29   | 01 March 2024    |                  | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 3  | 31   | 01 April 2024    |                  | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 4  | 30   | 01 May 2024      |                  | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#    Then Loan Repayment schedule has the following data in Total row:
#      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
#      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 17.13 | 0.0        | 0.0  | 85.65       |
#    Then Loan Transactions tab has the following data:
#      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
#      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
#   --- 2nd disbursement in first period ---
    When Admin sets the business date to "08 January 2024"
    When Admin successfully disburse the loan on "08 January 2024" with "200" EUR transaction amount
#     Then Loan Repayment schedule has 6 periods, with the following data for periods:
#      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
#      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
#      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
#      |    |      | 08 February 2024 |                  | 200.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
#      | 2  | 29   | 01 March 2024    |                  | 227.52          | 56.14         | 1.86     | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 3  | 31   | 01 April 2024    |                  | 171.32          | 56.2          | 1.8      | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 4  | 30   | 01 May 2024      |                  | 114.67          | 56.65         | 1.35     | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 5  | 31   | 01 June 2024     |                  | 57.58           | 57.09         | 0.91     | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 6  | 30   | 01 July 2024     |                  | 0.0             | 57.58         | 0.45     | 0.0  | 0.0       | 58.03 | 0.0   | 0.0        | 0.0  | 58.03       |
#    Then Loan Repayment schedule has the following data in Total row:
#      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
#      | 300.0         | 7.16     | 0.0  | 0.0       | 307.16 | 17.13 | 0.0        | 0.0  | 290.03      |
#    Then Loan Transactions tab has the following data:
#      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
#      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
#      | 08 February 2024 | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 283.66       |

#  TODO unskip and check when early repayment for EMI is implemented (PS-2076, PS-1958)
  @Skip @TestRailId:C3196
  Scenario: EMI calculation with 365/30 multidisburse setup - UC3: 1st installment fully repaid early, then 2nd disbursement in 1std installment period, allocation rule: LAST INSTALLMENT
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                           | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 300            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "300" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#    --- Early full repayment of 1st installment ---
    When Admin sets the business date to "05 January 2024"
    And Customer makes "AUTOPAY" repayment on "05 January 2024" with 17.13 EUR transaction amount
#    Then Loan Repayment schedule has 6 periods, with the following data for periods:
#      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
#      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
#      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
#      | 2  | 29   | 01 March 2024    |                  | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 3  | 31   | 01 April 2024    |                  | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 4  | 30   | 01 May 2024      |                  | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
#    Then Loan Repayment schedule has the following data in Total row:
#      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
#      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 17.13 | 0.0        | 0.0  | 85.65       |
#    Then Loan Transactions tab has the following data:
#      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
#      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
#   --- 2nd disbursement in first period ---
    When Admin sets the business date to "08 January 2024"
    When Admin successfully disburse the loan on "08 January 2024" with "200" EUR transaction amount
#     Then Loan Repayment schedule has 6 periods, with the following data for periods:
#      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
#      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
#      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
#      |    |      | 08 February 2024 |                  | 200.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
#      | 2  | 29   | 01 March 2024    |                  | 227.52          | 56.14         | 1.86     | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 3  | 31   | 01 April 2024    |                  | 171.32          | 56.2          | 1.8      | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 4  | 30   | 01 May 2024      |                  | 114.67          | 56.65         | 1.35     | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 5  | 31   | 01 June 2024     |                  | 57.58           | 57.09         | 0.91     | 0.0  | 0.0       | 58.0  | 0.0   | 0.0        | 0.0  | 58.0        |
#      | 6  | 30   | 01 July 2024     |                  | 0.0             | 57.58         | 0.45     | 0.0  | 0.0       | 58.03 | 0.0   | 0.0        | 0.0  | 58.03       |
#    Then Loan Repayment schedule has the following data in Total row:
#      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
#      | 300.0         | 7.16     | 0.0  | 0.0       | 307.16 | 17.13 | 0.0        | 0.0  | 290.03      |
#    Then Loan Transactions tab has the following data:
#      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
#      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
#      | 08 February 2024 | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 283.66       |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3197
  Scenario: EMI calculation with 365/30 multidisburse setup - UC4: 1st installment fully repaid on due date, 2nd disbursement in middle of 2nd installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                           | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 300            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "300" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#    --- Repayment of 1st installment on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.13 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |                  | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |                  | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 17.13 | 0.0        | 0.0  | 85.65       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
#    --- 2nd disbursement in the middle of 2nd installment period ---
    When Admin sets the business date to "15 February 2024"
    When Admin successfully disburse the loan on "15 February 2024" with "200" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
      |    |      | 15 February 2024 |                  | 200.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 2  | 29   | 01 March 2024    |                  | 227.21          | 56.45         | 1.48     | 0.0  | 0.0       | 57.93 | 0.0   | 0.0        | 0.0  | 57.93       |
      | 3  | 31   | 01 April 2024    |                  | 171.08          | 56.13         | 1.8      | 0.0  | 0.0       | 57.93 | 0.0   | 0.0        | 0.0  | 57.93       |
      | 4  | 30   | 01 May 2024      |                  | 114.5           | 56.58         | 1.35     | 0.0  | 0.0       | 57.93 | 0.0   | 0.0        | 0.0  | 57.93       |
      | 5  | 31   | 01 June 2024     |                  | 57.47           | 57.03         | 0.9      | 0.0  | 0.0       | 57.93 | 0.0   | 0.0        | 0.0  | 57.93       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 57.47         | 0.45     | 0.0  | 0.0       | 57.92 | 0.0   | 0.0        | 0.0  | 57.92       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 300.0         | 6.77     | 0.0  | 0.0       | 306.77 | 17.13 | 0.0        | 0.0  | 289.64      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
      | 15 February 2024 | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 283.66       |

  @TestRailId:C3198
  Scenario: EMI calculation with 365/30 multidisburse setup - UC5: 1st installment fully repaid on due date, 2nd disbursement at the end of 2nd installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                           | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 300            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "300" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#    --- Repayment of 1st installment on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.13 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |                  | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |                  | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0   | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 17.13 | 0.0        | 0.0  | 85.65       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
#    --- 2nd disbursement at the end of 2nd installment period ---
    When Admin sets the business date to "25 February 2024"
    When Admin successfully disburse the loan on "25 February 2024" with "200" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 17.13 | 0.0        | 0.0  | 0.0         |
      |    |      | 25 February 2024 |                  | 200.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 2  | 29   | 01 March 2024    |                  | 226.78          | 56.88         | 0.94     | 0.0  | 0.0       | 57.82 | 0.0   | 0.0        | 0.0  | 57.82       |
      | 3  | 31   | 01 April 2024    |                  | 170.75          | 56.03         | 1.79     | 0.0  | 0.0       | 57.82 | 0.0   | 0.0        | 0.0  | 57.82       |
      | 4  | 30   | 01 May 2024      |                  | 114.28          | 56.47         | 1.35     | 0.0  | 0.0       | 57.82 | 0.0   | 0.0        | 0.0  | 57.82       |
      | 5  | 31   | 01 June 2024     |                  | 57.36           | 56.92         | 0.9      | 0.0  | 0.0       | 57.82 | 0.0   | 0.0        | 0.0  | 57.82       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 57.36         | 0.45     | 0.0  | 0.0       | 57.81 | 0.0   | 0.0        | 0.0  | 57.81       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 300.0         | 6.22     | 0.0  | 0.0       | 306.22 | 17.13 | 0.0        | 0.0  | 289.09      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 February 2024 | Repayment        | 17.13  | 16.34     | 0.79     | 0.0  | 0.0       | 83.66        |
      | 25 February 2024 | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 283.66       |

  @TestRailId:C3199
  Scenario: EMI calculation with 365/30 multidisburse setup - UC6: no repayment, 2nd disbursement at the due date of 2nd installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                           | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 300            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "300" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 3  | 31   | 01 April 2024    |           | 50.59           | 16.6          | 0.53     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 4  | 30   | 01 May 2024      |           | 33.86           | 16.73         | 0.4      | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 5  | 31   | 01 June 2024     |           | 17.0            | 16.86         | 0.27     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.0          | 0.13     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.78     | 0.0  | 0.0       | 102.78 | 0.0  | 0.0        | 0.0  | 102.78      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#    --- 2nd disbursement at the due date of 2nd installment period ---
    When Admin sets the business date to "01 March 2024"
    When Admin successfully disburse the loan on "01 March 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.66           | 16.34         | 0.79     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      | 2  | 29   | 01 March 2024    |           | 67.19           | 16.47         | 0.66     | 0.0  | 0.0       | 17.13 | 0.0  | 0.0        | 0.0  | 17.13       |
      |    |      | 01 March 2024    |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 3  | 31   | 01 April 2024    |           | 125.88          | 41.31         | 1.32     | 0.0  | 0.0       | 42.63 | 0.0  | 0.0        | 0.0  | 42.63       |
      | 4  | 30   | 01 May 2024      |           | 84.24           | 41.64         | 0.99     | 0.0  | 0.0       | 42.63 | 0.0  | 0.0        | 0.0  | 42.63       |
      | 5  | 31   | 01 June 2024     |           | 42.28           | 41.96         | 0.67     | 0.0  | 0.0       | 42.63 | 0.0  | 0.0        | 0.0  | 42.63       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 42.28         | 0.33     | 0.0  | 0.0       | 42.61 | 0.0  | 0.0        | 0.0  | 42.61       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 200.0         | 4.76     | 0.0  | 0.0       | 204.76 | 0.0  | 0.0        | 0.0  | 204.76      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 March 2024    | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        |

  @TestRailId:C3200
  Scenario: EMI calculation with 365/30 downpayment setup - UC1: happy path - monthly repayment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 5                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 5                 | MONTHS                | 1              | MONTHS                 | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 31   | 01 February 2024 |           | 60.12           | 14.88         | 0.31     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 3  | 29   | 01 March 2024    |           | 45.18           | 14.94         | 0.25     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 4  | 31   | 01 April 2024    |           | 30.18           | 15.0          | 0.19     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 5  | 30   | 01 May 2024      |           | 15.12           | 15.06         | 0.13     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 6  | 31   | 01 June 2024     |           | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.94     | 0.0  | 0.0       | 100.94 | 0.0  | 0.0        | 0.0  | 100.94      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |

  @TestRailId:C3201
  Scenario: EMI calculation with 365/30 multidisburse, downpayment setup - UC1: no repayment, 2nd disbursement in the middle of 1st period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE_DOWNPAYMENT | 01 January 2024   | 200            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 5                 | MONTHS                | 1              | MONTHS                 | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "200" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 31   | 01 February 2024 |           | 60.23           | 14.77         | 0.59     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 3  | 29   | 01 March 2024    |           | 45.35           | 14.88         | 0.48     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 4  | 31   | 01 April 2024    |           | 30.35           | 15.0          | 0.36     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 5  | 30   | 01 May 2024      |           | 15.23           | 15.12         | 0.24     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 6  | 31   | 01 June 2024     |           | 0.0             | 15.23         | 0.12     | 0.0  | 0.0       | 15.35 | 0.0  | 0.0        | 0.0  | 15.35       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.79     | 0.0  | 0.0       | 101.79 | 0.0  | 0.0        | 0.0  | 101.79      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#    --- 2nd disbursement in the middle of 1st period ---
    When Admin sets the business date to "15 January 2024"
    When Admin successfully disburse the loan on "15 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 7 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      |    |      | 15 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 2  | 0    | 15 January 2024  |           | 150.0           | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 3  | 31   | 01 February 2024 |           | 120.26          | 29.74         | 0.92     | 0.0  | 0.0       | 30.66 | 0.0  | 0.0        | 0.0  | 30.66       |
      | 4  | 29   | 01 March 2024    |           | 90.55           | 29.71         | 0.95     | 0.0  | 0.0       | 30.66 | 0.0  | 0.0        | 0.0  | 30.66       |
      | 5  | 31   | 01 April 2024    |           | 60.61           | 29.94         | 0.72     | 0.0  | 0.0       | 30.66 | 0.0  | 0.0        | 0.0  | 30.66       |
      | 6  | 30   | 01 May 2024      |           | 30.43           | 30.18         | 0.48     | 0.0  | 0.0       | 30.66 | 0.0  | 0.0        | 0.0  | 30.66       |
      | 7  | 31   | 01 June 2024     |           | 0.0             | 30.43         | 0.24     | 0.0  | 0.0       | 30.67 | 0.0  | 0.0        | 0.0  | 30.67       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 200.0         | 3.31     | 0.0  | 0.0       | 203.31 | 0.0  | 0.0        | 0.0  | 203.31      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 15 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        |

  @TestRailId:C3204
  Scenario: EMI calculation with 365/30 downpayment setup - UC2: happy path - 2 weeks repayment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 10                | WEEKS                 | 2              | WEEKS                  | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 14   | 15 January 2024  |           | 60.11           | 14.89         | 0.28     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 3  | 14   | 29 January 2024  |           | 45.16           | 14.95         | 0.22     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 4  | 14   | 12 February 2024 |           | 30.16           | 15.0          | 0.17     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 5  | 14   | 26 February 2024 |           | 15.1            | 15.06         | 0.11     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 6  | 14   | 11 March 2024    |           | 0.0             | 15.1          | 0.06     | 0.0  | 0.0       | 15.16 | 0.0  | 0.0        | 0.0  | 15.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.84     | 0.0  | 0.0       | 100.84 | 0.0  | 0.0        | 0.0  | 100.84      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |

  @TestRailId:C3205
  Scenario: EMI calculation with 365/30 downpayment setup - UC3: happy path - 30 days repayment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 150               | DAYS                  | 30             | DAYS                   | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date            | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024 |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024 |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 30   | 31 January 2024 |           | 60.23           | 14.77         | 0.59     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 3  | 30   | 01 March 2024   |           | 45.35           | 14.88         | 0.48     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 4  | 30   | 31 March 2024   |           | 30.35           | 15.0          | 0.36     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 5  | 30   | 30 April 2024   |           | 15.23           | 15.12         | 0.24     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 6  | 30   | 30 May 2024     |           | 0.0             | 15.23         | 0.12     | 0.0  | 0.0       | 15.35 | 0.0  | 0.0        | 0.0  | 15.35       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.79     | 0.0  | 0.0       | 101.79 | 0.0  | 0.0        | 0.0  | 101.79      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |

  @TestRailId:C3206
  Scenario: EMI calculation with 365/30 downpayment setup - UC4: happy path - 15 days repayment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 75                | DAYS                  | 15             | DAYS                   | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 15   | 16 January 2024  |           | 60.12           | 14.88         | 0.3      | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 3  | 15   | 31 January 2024  |           | 45.18           | 14.94         | 0.24     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 4  | 15   | 15 February 2024 |           | 30.18           | 15.0          | 0.18     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 5  | 15   | 01 March 2024    |           | 15.12           | 15.06         | 0.12     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 6  | 15   | 16 March 2024    |           | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.9      | 0.0  | 0.0       | 100.9 | 0.0  | 0.0        | 0.0  | 100.9       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |

  @TestRailId:C3207
  Scenario: EMI calculation with 365/30 downpayment setup - UC5: monthly repayment, partial repayment on 1st installment due date, backdated partial repayment on 1st installment due date (fully paid), 1st repayment undo
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 5                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 5                 | MONTHS                | 1              | MONTHS                 | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 31   | 01 February 2024 |           | 60.12           | 14.88         | 0.31     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 3  | 29   | 01 March 2024    |           | 45.18           | 14.94         | 0.25     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 4  | 31   | 01 April 2024    |           | 30.18           | 15.0          | 0.19     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 5  | 30   | 01 May 2024      |           | 15.12           | 15.06         | 0.13     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 6  | 31   | 01 June 2024     |           | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.94     | 0.0  | 0.0       | 100.94 | 0.0  | 0.0        | 0.0  | 100.94      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
#    --- Downpayment paid on due date ---
    And Customer makes "AUTOPAY" repayment on "01 January 2024" with 25 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 01 February 2024 |                 | 60.12           | 14.88         | 0.31     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 3  | 29   | 01 March 2024    |                 | 45.18           | 14.94         | 0.25     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 4  | 31   | 01 April 2024    |                 | 30.18           | 15.0          | 0.19     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 5  | 30   | 01 May 2024      |                 | 15.12           | 15.06         | 0.13     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 6  | 31   | 01 June 2024     |                 | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.94     | 0.0  | 0.0       | 100.94 | 25.0 | 0.0        | 0.0  | 75.94       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
#   --- 1st installment partially paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 01 February 2024 |                 | 60.12           | 14.88         | 0.31     | 0.0  | 0.0       | 15.19 | 10.0 | 0.0        | 0.0  | 5.19        |
      | 3  | 29   | 01 March 2024    |                 | 45.18           | 14.94         | 0.25     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 4  | 31   | 01 April 2024    |                 | 30.18           | 15.0          | 0.19     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 5  | 30   | 01 May 2024      |                 | 15.12           | 15.06         | 0.13     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 6  | 31   | 01 June 2024     |                 | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.94     | 0.0  | 0.0       | 100.94 | 35.0 | 0.0        | 0.0  | 65.94       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 01 February 2024 | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
#    --- 1st installment fully paid by  payment backdated to due date ---
    When Admin sets the business date to "15 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 5.19 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024  | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0  | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 01 February 2024 | 01 February 2024 | 60.12           | 14.88         | 0.31     | 0.0  | 0.0       | 15.19 | 15.19 | 0.0        | 0.0  | 0.0         |
      | 3  | 29   | 01 March 2024    |                  | 45.18           | 14.94         | 0.25     | 0.0  | 0.0       | 15.19 | 0.0   | 0.0        | 0.0  | 15.19       |
      | 4  | 31   | 01 April 2024    |                  | 30.18           | 15.0          | 0.19     | 0.0  | 0.0       | 15.19 | 0.0   | 0.0        | 0.0  | 15.19       |
      | 5  | 30   | 01 May 2024      |                  | 15.12           | 15.06         | 0.13     | 0.0  | 0.0       | 15.19 | 0.0   | 0.0        | 0.0  | 15.19       |
      | 6  | 31   | 01 June 2024     |                  | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0   | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.94     | 0.0  | 0.0       | 100.94 | 40.19 | 0.0        | 0.0  | 60.75       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 01 February 2024 | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
      | 01 February 2024 | Repayment        | 5.19   | 4.88      | 0.31     | 0.0  | 0.0       | 60.12        |
#    --- First repayment reversed ---
    When Admin sets the business date to "16 February 2024"
    When Customer undo "1"th "Repayment" transaction made on "01 February 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 01 February 2024 |                 | 60.12           | 14.88         | 0.31     | 0.0  | 0.0       | 15.19 | 5.19 | 0.0        | 0.0  | 10.0        |
      | 3  | 29   | 01 March 2024    |                 | 45.18           | 14.94         | 0.25     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 4  | 31   | 01 April 2024    |                 | 30.18           | 15.0          | 0.19     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 5  | 30   | 01 May 2024      |                 | 15.12           | 15.06         | 0.13     | 0.0  | 0.0       | 15.19 | 0.0  | 0.0        | 0.0  | 15.19       |
      | 6  | 31   | 01 June 2024     |                 | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.94     | 0.0  | 0.0       | 100.94 | 30.19 | 0.0        | 0.0  | 70.75       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         | false    | false    |
      | 01 February 2024 | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         | true     | false    |
      | 01 February 2024 | Repayment        | 5.19   | 5.19      | 0.0      | 0.0  | 0.0       | 69.81        | false    | true     |

  @TestRailId:C3208
  Scenario: EMI calculation with 365/30 downpayment setup - UC6: 2 weeks repayment, partial repayment on 1st installment due date, backdated partial repayment on 1st installment due date (fully paid), 1st repayment undo
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 10                | WEEKS                 | 2              | WEEKS                  | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 14   | 15 January 2024  |           | 60.11           | 14.89         | 0.28     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 3  | 14   | 29 January 2024  |           | 45.16           | 14.95         | 0.22     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 4  | 14   | 12 February 2024 |           | 30.16           | 15.0          | 0.17     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 5  | 14   | 26 February 2024 |           | 15.1            | 15.06         | 0.11     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 6  | 14   | 11 March 2024    |           | 0.0             | 15.1          | 0.06     | 0.0  | 0.0       | 15.16 | 0.0  | 0.0        | 0.0  | 15.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.84     | 0.0  | 0.0       | 100.84 | 0.0  | 0.0        | 0.0  | 100.84      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
    #    --- Downpayment paid on due date ---
    And Customer makes "AUTOPAY" repayment on "01 January 2024" with 25 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 14   | 15 January 2024  |                 | 60.11           | 14.89         | 0.28     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 3  | 14   | 29 January 2024  |                 | 45.16           | 14.95         | 0.22     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 4  | 14   | 12 February 2024 |                 | 30.16           | 15.0          | 0.17     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 5  | 14   | 26 February 2024 |                 | 15.1            | 15.06         | 0.11     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 6  | 14   | 11 March 2024    |                 | 0.0             | 15.1          | 0.06     | 0.0  | 0.0       | 15.16 | 0.0  | 0.0        | 0.0  | 15.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.84     | 0.0  | 0.0       | 100.84 | 25.0 | 0.0        | 0.0  | 75.84       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
#   --- 1st installment partially paid on due date ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 14   | 15 January 2024  |                 | 60.11           | 14.89         | 0.28     | 0.0  | 0.0       | 15.17 | 10.0 | 0.0        | 0.0  | 5.17        |
      | 3  | 14   | 29 January 2024  |                 | 45.16           | 14.95         | 0.22     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 4  | 14   | 12 February 2024 |                 | 30.16           | 15.0          | 0.17     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 5  | 14   | 26 February 2024 |                 | 15.1            | 15.06         | 0.11     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 6  | 14   | 11 March 2024    |                 | 0.0             | 15.1          | 0.06     | 0.0  | 0.0       | 15.16 | 0.0  | 0.0        | 0.0  | 15.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.84     | 0.0  | 0.0       | 100.84 | 35.0 | 0.0        | 0.0  | 65.84       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 15 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
#    --- 1st installment fully paid by  payment backdated to due date ---
    When Admin sets the business date to "20 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 5.17 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0  | 0.0        | 0.0  | 0.0         |
      | 2  | 14   | 15 January 2024  | 15 January 2024 | 60.11           | 14.89         | 0.28     | 0.0  | 0.0       | 15.17 | 15.17 | 0.0        | 0.0  | 0.0         |
      | 3  | 14   | 29 January 2024  |                 | 45.16           | 14.95         | 0.22     | 0.0  | 0.0       | 15.17 | 0.0   | 0.0        | 0.0  | 15.17       |
      | 4  | 14   | 12 February 2024 |                 | 30.16           | 15.0          | 0.17     | 0.0  | 0.0       | 15.17 | 0.0   | 0.0        | 0.0  | 15.17       |
      | 5  | 14   | 26 February 2024 |                 | 15.1            | 15.06         | 0.11     | 0.0  | 0.0       | 15.17 | 0.0   | 0.0        | 0.0  | 15.17       |
      | 6  | 14   | 11 March 2024    |                 | 0.0             | 15.1          | 0.06     | 0.0  | 0.0       | 15.16 | 0.0   | 0.0        | 0.0  | 15.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.84     | 0.0  | 0.0       | 100.84 | 40.17 | 0.0        | 0.0  | 60.67       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 15 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
      | 15 January 2024  | Repayment        | 5.17   | 4.89      | 0.28     | 0.0  | 0.0       | 60.11        |
#    --- First repayment reversed ---
    When Admin sets the business date to "21 January 2024"
    When Customer undo "1"th "Repayment" transaction made on "15 January 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 14   | 15 January 2024  |                 | 60.11           | 14.89         | 0.28     | 0.0  | 0.0       | 15.17 | 5.17 | 0.0        | 0.0  | 10.0        |
      | 3  | 14   | 29 January 2024  |                 | 45.16           | 14.95         | 0.22     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 4  | 14   | 12 February 2024 |                 | 30.16           | 15.0          | 0.17     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 5  | 14   | 26 February 2024 |                 | 15.1            | 15.06         | 0.11     | 0.0  | 0.0       | 15.17 | 0.0  | 0.0        | 0.0  | 15.17       |
      | 6  | 14   | 11 March 2024    |                 | 0.0             | 15.1          | 0.06     | 0.0  | 0.0       | 15.16 | 0.0  | 0.0        | 0.0  | 15.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.84     | 0.0  | 0.0       | 100.84 | 30.17 | 0.0        | 0.0  | 70.67       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         | false    | false    |
      | 15 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         | true     | false    |
      | 15 January 2024  | Repayment        | 5.17   | 5.17      | 0.0      | 0.0  | 0.0       | 69.83        | false    | true     |

  @TestRailId:C3209
  Scenario: EMI calculation with 365/30 downpayment setup - UC7: 30 days repayment, partial repayment on 1st installment due date, backdated partial repayment on 1st installment due date (fully paid), 1st repayment undo
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 150               | DAYS                  | 30             | DAYS                   | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date            | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024 |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024 |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 30   | 31 January 2024 |           | 60.23           | 14.77         | 0.59     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 3  | 30   | 01 March 2024   |           | 45.35           | 14.88         | 0.48     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 4  | 30   | 31 March 2024   |           | 30.35           | 15.0          | 0.36     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 5  | 30   | 30 April 2024   |           | 15.23           | 15.12         | 0.24     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 6  | 30   | 30 May 2024     |           | 0.0             | 15.23         | 0.12     | 0.0  | 0.0       | 15.35 | 0.0  | 0.0        | 0.0  | 15.35       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.79     | 0.0  | 0.0       | 101.79 | 0.0  | 0.0        | 0.0  | 101.79      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
     #    --- Downpayment paid on due date ---
    And Customer makes "AUTOPAY" repayment on "01 January 2024" with 25 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date            | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024 |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024 | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 30   | 31 January 2024 |                 | 60.23           | 14.77         | 0.59     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 3  | 30   | 01 March 2024   |                 | 45.35           | 14.88         | 0.48     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 4  | 30   | 31 March 2024   |                 | 30.35           | 15.0          | 0.36     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 5  | 30   | 30 April 2024   |                 | 15.23           | 15.12         | 0.24     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 6  | 30   | 30 May 2024     |                 | 0.0             | 15.23         | 0.12     | 0.0  | 0.0       | 15.35 | 0.0  | 0.0        | 0.0  | 15.35       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.79     | 0.0  | 0.0       | 101.79 | 25.0 | 0.0        | 0.0  | 76.79       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
#   --- 1st installment partially paid on due date ---
    When Admin sets the business date to "31 January 2024"
    And Customer makes "AUTOPAY" repayment on "31 January 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date            | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024 |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024 | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 30   | 31 January 2024 |                 | 60.23           | 14.77         | 0.59     | 0.0  | 0.0       | 15.36 | 10.0 | 0.0        | 0.0  | 5.36        |
      | 3  | 30   | 01 March 2024   |                 | 45.35           | 14.88         | 0.48     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 4  | 30   | 31 March 2024   |                 | 30.35           | 15.0          | 0.36     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 5  | 30   | 30 April 2024   |                 | 15.23           | 15.12         | 0.24     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 6  | 30   | 30 May 2024     |                 | 0.0             | 15.23         | 0.12     | 0.0  | 0.0       | 15.35 | 0.0  | 0.0        | 0.0  | 15.35       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.79     | 0.0  | 0.0       | 101.79 | 35.0 | 0.0        | 0.0  | 66.79       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 31 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
#    --- 1st installment fully paid by  payment backdated to due date ---
    When Admin sets the business date to "10 February 2024"
    And Customer makes "AUTOPAY" repayment on "31 January 2024" with 5.36 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date            | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024 |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 0    | 01 January 2024 | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0  | 0.0        | 0.0  | 0.0         |
      | 2  | 30   | 31 January 2024 | 31 January 2024 | 60.23           | 14.77         | 0.59     | 0.0  | 0.0       | 15.36 | 15.36 | 0.0        | 0.0  | 0.0         |
      | 3  | 30   | 01 March 2024   |                 | 45.35           | 14.88         | 0.48     | 0.0  | 0.0       | 15.36 | 0.0   | 0.0        | 0.0  | 15.36       |
      | 4  | 30   | 31 March 2024   |                 | 30.35           | 15.0          | 0.36     | 0.0  | 0.0       | 15.36 | 0.0   | 0.0        | 0.0  | 15.36       |
      | 5  | 30   | 30 April 2024   |                 | 15.23           | 15.12         | 0.24     | 0.0  | 0.0       | 15.36 | 0.0   | 0.0        | 0.0  | 15.36       |
      | 6  | 30   | 30 May 2024     |                 | 0.0             | 15.23         | 0.12     | 0.0  | 0.0       | 15.35 | 0.0   | 0.0        | 0.0  | 15.35       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.79     | 0.0  | 0.0       | 101.79 | 40.36 | 0.0        | 0.0  | 61.43       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 31 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
      | 31 January 2024  | Repayment        | 5.36   | 4.77      | 0.59     | 0.0  | 0.0       | 60.23        |
#    --- First repayment reversed ---
    When Admin sets the business date to "11 February 2024"
    When Customer undo "1"th "Repayment" transaction made on "31 January 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date            | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024 |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024 | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 30   | 31 January 2024 |                 | 60.23           | 14.77         | 0.59     | 0.0  | 0.0       | 15.36 | 5.36 | 0.0        | 0.0  | 10.0        |
      | 3  | 30   | 01 March 2024   |                 | 45.35           | 14.88         | 0.48     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 4  | 30   | 31 March 2024   |                 | 30.35           | 15.0          | 0.36     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 5  | 30   | 30 April 2024   |                 | 15.23           | 15.12         | 0.24     | 0.0  | 0.0       | 15.36 | 0.0  | 0.0        | 0.0  | 15.36       |
      | 6  | 30   | 30 May 2024     |                 | 0.0             | 15.23         | 0.12     | 0.0  | 0.0       | 15.35 | 0.0  | 0.0        | 0.0  | 15.35       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.79     | 0.0  | 0.0       | 101.79 | 30.36 | 0.0        | 0.0  | 71.43       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         | false    | false    |
      | 31 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         | true     | false    |
      | 31 January 2024  | Repayment        | 5.36   | 5.36      | 0.0      | 0.0  | 0.0       | 69.64        | false    | true     |

  @TestRailId:C3210
  Scenario: EMI calculation with 365/30 downpayment setup - UC8: 15 days repayment, partial repayment on 1st installment due date, backdated partial repayment on 1st installment due date (fully paid), 1st repayment undo
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_DOWNPAYMENT | 01 January 2024   | 100            | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 75                | DAYS                  | 15             | DAYS                   | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  |           | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 0.0  | 0.0        | 0.0  | 25.0        |
      | 2  | 15   | 16 January 2024  |           | 60.12           | 14.88         | 0.3      | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 3  | 15   | 31 January 2024  |           | 45.18           | 14.94         | 0.24     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 4  | 15   | 15 February 2024 |           | 30.18           | 15.0          | 0.18     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 5  | 15   | 01 March 2024    |           | 15.12           | 15.06         | 0.12     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 6  | 15   | 16 March 2024    |           | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.9      | 0.0  | 0.0       | 100.9 | 0.0  | 0.0        | 0.0  | 100.9       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      #    --- Downpayment paid on due date ---
    And Customer makes "AUTOPAY" repayment on "01 January 2024" with 25 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 15   | 16 January 2024  |                 | 60.12           | 14.88         | 0.3      | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 3  | 15   | 31 January 2024  |                 | 45.18           | 14.94         | 0.24     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 4  | 15   | 15 February 2024 |                 | 30.18           | 15.0          | 0.18     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 5  | 15   | 01 March 2024    |                 | 15.12           | 15.06         | 0.12     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 6  | 15   | 16 March 2024    |                 | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.9      | 0.0  | 0.0       | 100.9 | 25.0 | 0.0        | 0.0  | 75.9        |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
#   --- 1st installment partially paid on due date ---
    When Admin sets the business date to "16 January 2024"
    And Customer makes "AUTOPAY" repayment on "16 January 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 15   | 16 January 2024  |                 | 60.12           | 14.88         | 0.3      | 0.0  | 0.0       | 15.18 | 10.0 | 0.0        | 0.0  | 5.18        |
      | 3  | 15   | 31 January 2024  |                 | 45.18           | 14.94         | 0.24     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 4  | 15   | 15 February 2024 |                 | 30.18           | 15.0          | 0.18     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 5  | 15   | 01 March 2024    |                 | 15.12           | 15.06         | 0.12     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 6  | 15   | 16 March 2024    |                 | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.9      | 0.0  | 0.0       | 100.9 | 35.0 | 0.0        | 0.0  | 65.9        |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 16 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
#    --- 1st installment fully paid by  payment backdated to due date ---
    When Admin sets the business date to "20 January 2024"
    And Customer makes "AUTOPAY" repayment on "16 January 2024" with 5.18 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0  | 0.0        | 0.0  | 0.0         |
      | 2  | 15   | 16 January 2024  | 16 January 2024 | 60.12           | 14.88         | 0.3      | 0.0  | 0.0       | 15.18 | 15.18 | 0.0        | 0.0  | 0.0         |
      | 3  | 15   | 31 January 2024  |                 | 45.18           | 14.94         | 0.24     | 0.0  | 0.0       | 15.18 | 0.0   | 0.0        | 0.0  | 15.18       |
      | 4  | 15   | 15 February 2024 |                 | 30.18           | 15.0          | 0.18     | 0.0  | 0.0       | 15.18 | 0.0   | 0.0        | 0.0  | 15.18       |
      | 5  | 15   | 01 March 2024    |                 | 15.12           | 15.06         | 0.12     | 0.0  | 0.0       | 15.18 | 0.0   | 0.0        | 0.0  | 15.18       |
      | 6  | 15   | 16 March 2024    |                 | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0   | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.9      | 0.0  | 0.0       | 100.9 | 40.18 | 0.0        | 0.0  | 60.72       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         |
      | 16 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         |
      | 16 January 2024  | Repayment        | 5.18   | 4.88      | 0.3      | 0.0  | 0.0       | 60.12        |
#    --- First repayment reversed ---
    When Admin sets the business date to "21 January 2024"
    When Customer undo "1"th "Repayment" transaction made on "16 January 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 01 January 2024  | 01 January 2024 | 75.0            | 25.0          | 0.0      | 0.0  | 0.0       | 25.0  | 25.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 15   | 16 January 2024  |                 | 60.12           | 14.88         | 0.3      | 0.0  | 0.0       | 15.18 | 5.18 | 0.0        | 0.0  | 10.0        |
      | 3  | 15   | 31 January 2024  |                 | 45.18           | 14.94         | 0.24     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 4  | 15   | 15 February 2024 |                 | 30.18           | 15.0          | 0.18     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 5  | 15   | 01 March 2024    |                 | 15.12           | 15.06         | 0.12     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
      | 6  | 15   | 16 March 2024    |                 | 0.0             | 15.12         | 0.06     | 0.0  | 0.0       | 15.18 | 0.0  | 0.0        | 0.0  | 15.18       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.9      | 0.0  | 0.0       | 100.9 | 30.18 | 0.0        | 0.0  | 70.72       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 January 2024  | Repayment        | 25.0   | 25.0      | 0.0      | 0.0  | 0.0       | 75.0         | false    | false    |
      | 16 January 2024  | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 65.0         | true     | false    |
      | 16 January 2024  | Repayment        | 5.18   | 5.18      | 0.0      | 0.0  | 0.0       | 69.82        | false    | true     |

  @TestRailId:C3211
  Scenario: Verify the Pay-off transaction - UC1: 360/30, regular payment, preClosureInterestCalculationStrategy = till pre-close date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#    --- Pay-off between 1st and 2nd installment ---
    When Admin sets the business date to "15 February 2024"
    When Loan Pay-off is made on "15 February 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 66.8            | 16.77         | 0.24     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 15 February 2024 | 49.79           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 15 February 2024 | 32.78           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 15 February 2024 | 15.77           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 February 2024 | 0.0             | 15.77         | 0.0      | 0.0  | 0.0       | 15.77 | 15.77 | 15.77      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 100.0         | 0.82     | 0.0  | 0.0       | 100.82 | 100.82 | 83.81      | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 15 February 2024 | Repayment        | 83.81  | 83.57     | 0.24     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.82   | 0.0       | 0.82     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan's all installments have obligations met

  @TestRailId:C3212
  Scenario: Verify the Pay-off transaction - UC2: 360/30, regular payment, preClosureInterestCalculationStrategy = till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#    --- Pay-off between 1st and 2nd installment ---
    When Admin sets the business date to "15 February 2024"
    When Loan Pay-off is made on "15 February 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 15 February 2024 | 50.04           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 15 February 2024 | 33.03           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 15 February 2024 | 16.02           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 February 2024 | 0.0             | 16.02         | 0.0      | 0.0  | 0.0       | 16.02 | 16.02 | 16.02      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 100.0         | 1.07     | 0.0  | 0.0       | 101.07 | 101.07 | 84.06      | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 15 February 2024 | Repayment        | 84.06  | 83.57     | 0.49     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 1.07   | 0.0       | 1.07     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan's all installments have obligations met

  @TestRailId:C3213
  Scenario: Verify the Pay-off transaction - UC3: 360/30, pre-close on overdue loan, preClosureInterestCalculationStrategy = till pre-close date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Pay-off between 1st and 2nd installment, 1st installment is overdue ---
    When Admin sets the business date to "15 February 2024"
    When Loan Pay-off is made on "15 February 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 66.84           | 16.73         | 0.28     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 3  | 31   | 01 April 2024    | 15 February 2024 | 49.83           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 4  | 30   | 01 May 2024      | 15 February 2024 | 32.82           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 5  | 31   | 01 June 2024     | 15 February 2024 | 15.81           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 February 2024 | 0.0             | 15.81         | 0.0      | 0.0  | 0.0       | 15.81 | 15.81 | 15.81      | 0.0   | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late  | Outstanding |
      | 100.0         | 0.86     | 0.0  | 0.0       | 100.86 | 100.86 | 83.85      | 17.01 | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 February 2024 | Repayment        | 100.86 | 100.0     | 0.86     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.86   | 0.0       | 0.86     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan's all installments have obligations met

  @TestRailId:C3214
  Scenario: Verify the Pay-off transaction - UC2: 360/30, pre-close on overdue loan, preClosureInterestCalculationStrategy = till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Pay-off between 1st and 2nd installment, 1st installment is overdue ---
    When Admin sets the business date to "15 February 2024"
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 101.11 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 67.09           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 3  | 31   | 01 April 2024    | 15 February 2024 | 50.08           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 4  | 30   | 01 May 2024      | 15 February 2024 | 33.07           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 5  | 31   | 01 June 2024     | 15 February 2024 | 16.06           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 February 2024 | 0.0             | 16.06         | 0.0      | 0.0  | 0.0       | 16.06 | 16.06 | 16.06      | 0.0   | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late  | Outstanding |
      | 100.0         | 1.11     | 0.0  | 0.0       | 101.11 | 101.11 | 84.1       | 17.01 | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 February 2024 | Repayment        | 101.11 | 100.0     | 1.11     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 1.11   | 0.0       | 1.11     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan's all installments have obligations met

  @TestRailId:C3215
  Scenario: Verify the Loan reschedule - Interest modification - UC1: Interest modification on 1st installment due date (installment paid), effective from next day
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    #    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#   --- Loan reschedule: Interest rate modification effective from next day ---
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate  | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 02 February 2024   | 01 February 2024 |                 |                  |                 |            | 4               |
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 66.97           | 16.6          | 0.28     | 0.0  | 0.0       | 16.88 | 0.0   | 0.0        | 0.0  | 16.88       |
      | 3  | 31   | 01 April 2024    |                  | 50.31           | 16.66         | 0.22     | 0.0  | 0.0       | 16.88 | 0.0   | 0.0        | 0.0  | 16.88       |
      | 4  | 30   | 01 May 2024      |                  | 33.6            | 16.71         | 0.17     | 0.0  | 0.0       | 16.88 | 0.0   | 0.0        | 0.0  | 16.88       |
      | 5  | 31   | 01 June 2024     |                  | 16.83           | 16.77         | 0.11     | 0.0  | 0.0       | 16.88 | 0.0   | 0.0        | 0.0  | 16.88       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.83         | 0.06     | 0.0  | 0.0       | 16.89 | 0.0   | 0.0        | 0.0  | 16.89       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.42     | 0.0  | 0.0       | 101.42 | 17.01 | 0.0        | 0.0  | 84.41       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |

  @TestRailId:C3216
  Scenario: Verify the Loan reschedule - Interest modification - UC2: Interest modification between 1st and 2nd installment due date (1st installment paid)
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    #    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#   --- Loan reschedule: Interest rate modification between two installments ---
    When Admin sets the business date to "14 February 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate  | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 15 February 2024   | 14 February 2024 |                 |                  |                 |            | 4               |
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.04           | 16.53         | 0.37     | 0.0  | 0.0       | 16.9  | 0.0   | 0.0        | 0.0  | 16.9        |
      | 3  | 31   | 01 April 2024    |                  | 50.36           | 16.68         | 0.22     | 0.0  | 0.0       | 16.9  | 0.0   | 0.0        | 0.0  | 16.9        |
      | 4  | 30   | 01 May 2024      |                  | 33.63           | 16.73         | 0.17     | 0.0  | 0.0       | 16.9  | 0.0   | 0.0        | 0.0  | 16.9        |
      | 5  | 31   | 01 June 2024     |                  | 16.84           | 16.79         | 0.11     | 0.0  | 0.0       | 16.9  | 0.0   | 0.0        | 0.0  | 16.9        |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.84         | 0.06     | 0.0  | 0.0       | 16.9  | 0.0   | 0.0        | 0.0  | 16.9        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.51     | 0.0  | 0.0       | 101.51 | 17.01 | 0.0        | 0.0  | 84.5        |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |

  @TestRailId:C3217
  Scenario: Verify the Loan reschedule - Interest modification - UC3: Interest modification results an error when rescheduleFromDate equals business date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    When Admin sets the business date to "14 February 2024"
    Then Loan reschedule with the following data results a 403 error and "LOAN_RESCHEDULE_DATE_NOT_IN_FUTURE" error message
      | rescheduleFromDate | submittedOnDate  | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 14 February 2024   | 14 February 2024 |                 | 0                | 0               | 0          | 4               |

  @TestRailId:C3218
  Scenario: Verify the Loan reschedule - Interest modification - UC4: Interest modification results an error when rescheduleFromDate is earlier than business date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                             | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    When Admin sets the business date to "14 February 2024"
    Then Loan reschedule with the following data results a 403 error and "LOAN_RESCHEDULE_DATE_NOT_IN_FUTURE" error message
      | rescheduleFromDate | submittedOnDate  | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 13 February 2024   | 14 February 2024 |                 | 0                | 0               | 0          | 4               |

  @TestRailId:C3219
  Scenario: Verify Repayment schedule in case of 2nd disbursement (created on business date before 1st installment) is backdated to before 1st disbursement
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE_DOWNPAYMENT | 01 January 2024   | 1000           | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin sets the business date to "05 January 2024"
    When Admin successfully disburse the loan on "05 January 2024" with "200" EUR transaction amount
    Then Loan Repayment schedule has 7 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 05 January 2024  |           | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 05 January 2024  |           | 150.0           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 0.0  | 0.0        | 0.0  | 50.0        |
      | 2  | 31   | 05 February 2024 |           | 125.62          | 24.38         | 1.5      | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 3  | 29   | 05 March 2024    |           | 101.0           | 24.62         | 1.26     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 4  | 31   | 05 April 2024    |           | 76.13           | 24.87         | 1.01     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 5  | 30   | 05 May 2024      |           | 51.01           | 25.12         | 0.76     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 6  | 31   | 05 June 2024     |           | 25.64           | 25.37         | 0.51     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 7  | 30   | 05 July 2024     |           | 0.0             | 25.64         | 0.26     | 0.0  | 0.0       | 25.9  | 0.0  | 0.0        | 0.0  | 25.9        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 200.0         | 5.3      | 0.0  | 0.0       | 205.3 | 0.0  | 0.0        | 0.0  | 205.3       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        | false    | false    |
    When Admin sets the business date to "08 January 2024"
    When Admin successfully disburse the loan on "03 January 2024" with "350" EUR transaction amount
    Then Loan Repayment schedule has 8 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 03 January 2024  |           | 350.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 03 January 2024  |           | 262.5           | 87.5          | 0.0      | 0.0  | 0.0       | 87.5  | 0.0  | 0.0        | 0.0  | 87.5        |
      |    |      | 05 January 2024  |           | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 2  | 0    | 05 January 2024  |           | 412.5           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 0.0  | 0.0        | 0.0  | 50.0        |
      | 3  | 31   | 03 February 2024 |           | 345.37          | 67.13         | 4.03     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 4  | 29   | 03 March 2024    |           | 277.66          | 67.71         | 3.45     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 5  | 31   | 03 April 2024    |           | 209.28          | 68.38         | 2.78     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 6  | 30   | 03 May 2024      |           | 140.21          | 69.07         | 2.09     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 7  | 31   | 03 June 2024     |           | 70.45           | 69.76         | 1.4      | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 8  | 30   | 03 July 2024     |           | 0.0             | 70.45         | 0.7      | 0.0  | 0.0       | 71.15 | 0.0  | 0.0        | 0.0  | 71.15       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 550.0         | 14.45    | 0.0  | 0.0       | 564.45 | 0.0  | 0.0        | 0.0  | 564.45      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 350.0  | 0.0       | 0.0      | 0.0  | 0.0       | 350.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 550.0        | false    | false    |

  @TestRailId:C3220
  Scenario: Verify Repayment schedule in case of 2nd disbursement (created on business date after unpaid 1st installment) is backdated to before 1st disbursement
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE_DOWNPAYMENT | 01 January 2024   | 1000           | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin sets the business date to "05 January 2024"
    When Admin successfully disburse the loan on "05 January 2024" with "200" EUR transaction amount
    Then Loan Repayment schedule has 7 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 05 January 2024  |           | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 05 January 2024  |           | 150.0           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 0.0  | 0.0        | 0.0  | 50.0        |
      | 2  | 31   | 05 February 2024 |           | 125.62          | 24.38         | 1.5      | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 3  | 29   | 05 March 2024    |           | 101.0           | 24.62         | 1.26     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 4  | 31   | 05 April 2024    |           | 76.13           | 24.87         | 1.01     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 5  | 30   | 05 May 2024      |           | 51.01           | 25.12         | 0.76     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 6  | 31   | 05 June 2024     |           | 25.64           | 25.37         | 0.51     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 7  | 30   | 05 July 2024     |           | 0.0             | 25.64         | 0.26     | 0.0  | 0.0       | 25.9  | 0.0  | 0.0        | 0.0  | 25.9        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 200.0         | 5.3      | 0.0  | 0.0       | 205.3 | 0.0  | 0.0        | 0.0  | 205.3       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        | false    | false    |
    When Admin sets the business date to "08 February 2024"
    When Admin successfully disburse the loan on "03 January 2024" with "350" EUR transaction amount
    Then Loan Repayment schedule has 8 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 03 January 2024  |           | 350.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 03 January 2024  |           | 262.5           | 87.5          | 0.0      | 0.0  | 0.0       | 87.5  | 0.0  | 0.0        | 0.0  | 87.5        |
      |    |      | 05 January 2024  |           | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 2  | 0    | 05 January 2024  |           | 412.5           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 0.0  | 0.0        | 0.0  | 50.0        |
      | 3  | 31   | 03 February 2024 |           | 345.37          | 67.13         | 4.03     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 4  | 29   | 03 March 2024    |           | 277.66          | 67.71         | 3.45     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 5  | 31   | 03 April 2024    |           | 209.28          | 68.38         | 2.78     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 6  | 30   | 03 May 2024      |           | 140.21          | 69.07         | 2.09     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 7  | 31   | 03 June 2024     |           | 70.45           | 69.76         | 1.4      | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 8  | 30   | 03 July 2024     |           | 0.0             | 70.45         | 0.7      | 0.0  | 0.0       | 71.15 | 0.0  | 0.0        | 0.0  | 71.15       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 550.0         | 14.45    | 0.0  | 0.0       | 564.45 | 0.0  | 0.0        | 0.0  | 564.45      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 350.0  | 0.0       | 0.0      | 0.0  | 0.0       | 350.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 550.0        | false    | false    |

  @TestRailId:C3221
  Scenario: Verify Repayment schedule in case of 2nd disbursement (created on business date after unpaid 1st installment) is backdated to before 1st disbursement - downpayment paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE_DOWNPAYMENT | 01 January 2024   | 1000           | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin sets the business date to "05 January 2024"
    When Admin successfully disburse the loan on "05 January 2024" with "200" EUR transaction amount
    And Customer makes "AUTOPAY" repayment on "05 January 2024" with 50 EUR transaction amount
    Then Loan Repayment schedule has 7 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 05 January 2024  |                 | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 05 January 2024  | 05 January 2024 | 150.0           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 50.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 05 February 2024 |                 | 125.62          | 24.38         | 1.5      | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 3  | 29   | 05 March 2024    |                 | 101.0           | 24.62         | 1.26     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 4  | 31   | 05 April 2024    |                 | 76.13           | 24.87         | 1.01     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 5  | 30   | 05 May 2024      |                 | 51.01           | 25.12         | 0.76     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 6  | 31   | 05 June 2024     |                 | 25.64           | 25.37         | 0.51     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 7  | 30   | 05 July 2024     |                 | 0.0             | 25.64         | 0.26     | 0.0  | 0.0       | 25.9  | 0.0  | 0.0        | 0.0  | 25.9        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 200.0         | 5.3      | 0.0  | 0.0       | 205.3 | 50.0 | 0.0        | 0.0  | 155.3       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        | false    | false    |
      | 05 January 2024  | Repayment        | 50.0   | 50.0      | 0.0      | 0.0  | 0.0       | 150.0        | false    | false    |
    When Admin sets the business date to "08 February 2024"
    When Admin successfully disburse the loan on "03 January 2024" with "350" EUR transaction amount
    Then Loan Repayment schedule has 8 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 03 January 2024  |           | 350.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 03 January 2024  |           | 262.5           | 87.5          | 0.0      | 0.0  | 0.0       | 87.5  | 50.0 | 0.0        | 50.0 | 37.5        |
      |    |      | 05 January 2024  |           | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 2  | 0    | 05 January 2024  |           | 412.5           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 0.0  | 0.0        | 0.0  | 50.0        |
      | 3  | 31   | 03 February 2024 |           | 345.37          | 67.13         | 4.03     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 4  | 29   | 03 March 2024    |           | 277.66          | 67.71         | 3.45     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 5  | 31   | 03 April 2024    |           | 209.28          | 68.38         | 2.78     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 6  | 30   | 03 May 2024      |           | 140.21          | 69.07         | 2.09     | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 7  | 31   | 03 June 2024     |           | 70.45           | 69.76         | 1.4      | 0.0  | 0.0       | 71.16 | 0.0  | 0.0        | 0.0  | 71.16       |
      | 8  | 30   | 03 July 2024     |           | 0.0             | 70.45         | 0.7      | 0.0  | 0.0       | 71.15 | 0.0  | 0.0        | 0.0  | 71.15       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 550.0         | 14.45    | 0.0  | 0.0       | 564.45 | 50.0 | 0.0        | 50.0 | 514.45      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 350.0  | 0.0       | 0.0      | 0.0  | 0.0       | 350.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 550.0        | false    | false    |
      | 05 January 2024  | Repayment        | 50.0   | 50.0      | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |

  @TestRailId:C3222
  Scenario: Verify Repayment schedule in case of 2nd disbursement (created on business date after paid 1st installment) is backdated to before 1st disbursement - downpayment paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE_DOWNPAYMENT | 01 January 2024   | 1000           | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
#    --- 1st disbursement ---
    When Admin sets the business date to "05 January 2024"
    When Admin successfully disburse the loan on "05 January 2024" with "200" EUR transaction amount
#    --- 1st disbursement downpayment paid ---
    And Customer makes "AUTOPAY" repayment on "05 January 2024" with 50 EUR transaction amount
    Then Loan Repayment schedule has 7 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 05 January 2024  |                 | 200.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 0    | 05 January 2024  | 05 January 2024 | 150.0           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 50.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 05 February 2024 |                 | 125.62          | 24.38         | 1.5      | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 3  | 29   | 05 March 2024    |                 | 101.0           | 24.62         | 1.26     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 4  | 31   | 05 April 2024    |                 | 76.13           | 24.87         | 1.01     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 5  | 30   | 05 May 2024      |                 | 51.01           | 25.12         | 0.76     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 6  | 31   | 05 June 2024     |                 | 25.64           | 25.37         | 0.51     | 0.0  | 0.0       | 25.88 | 0.0  | 0.0        | 0.0  | 25.88       |
      | 7  | 30   | 05 July 2024     |                 | 0.0             | 25.64         | 0.26     | 0.0  | 0.0       | 25.9  | 0.0  | 0.0        | 0.0  | 25.9        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 200.0         | 5.3      | 0.0  | 0.0       | 205.3 | 50.0 | 0.0        | 0.0  | 155.3       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        | false    | false    |
      | 05 January 2024  | Repayment        | 50.0   | 50.0      | 0.0      | 0.0  | 0.0       | 150.0        | false    | false    |
#   --- 1st installment paid ---
    When Admin sets the business date to "05 February 2024"
    And Customer makes "AUTOPAY" repayment on "05 February 2024" with 25.88 EUR transaction amount
    Then Loan Repayment schedule has 7 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 05 January 2024  |                  | 200.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 0    | 05 January 2024  | 05 January 2024  | 150.0           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 50.0  | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 05 February 2024 | 05 February 2024 | 125.62          | 24.38         | 1.5      | 0.0  | 0.0       | 25.88 | 25.88 | 0.0        | 0.0  | 0.0         |
      | 3  | 29   | 05 March 2024    |                  | 101.0           | 24.62         | 1.26     | 0.0  | 0.0       | 25.88 | 0.0   | 0.0        | 0.0  | 25.88       |
      | 4  | 31   | 05 April 2024    |                  | 76.13           | 24.87         | 1.01     | 0.0  | 0.0       | 25.88 | 0.0   | 0.0        | 0.0  | 25.88       |
      | 5  | 30   | 05 May 2024      |                  | 51.01           | 25.12         | 0.76     | 0.0  | 0.0       | 25.88 | 0.0   | 0.0        | 0.0  | 25.88       |
      | 6  | 31   | 05 June 2024     |                  | 25.64           | 25.37         | 0.51     | 0.0  | 0.0       | 25.88 | 0.0   | 0.0        | 0.0  | 25.88       |
      | 7  | 30   | 05 July 2024     |                  | 0.0             | 25.64         | 0.26     | 0.0  | 0.0       | 25.9  | 0.0   | 0.0        | 0.0  | 25.9        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 200.0         | 5.3      | 0.0  | 0.0       | 205.3 | 75.88 | 0.0        | 0.0  | 129.42      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        | false    | false    |
      | 05 January 2024  | Repayment        | 50.0   | 50.0      | 0.0      | 0.0  | 0.0       | 150.0        | false    | false    |
      | 05 February 2024 | Repayment        | 25.88  | 24.38     | 1.5      | 0.0  | 0.0       | 125.62       | false    | false    |
#   --- Backdated second disbursement ---
    When Admin sets the business date to "08 February 2024"
    When Admin successfully disburse the loan on "03 January 2024" with "350" EUR transaction amount
    Then Loan Repayment schedule has 8 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 03 January 2024  |           | 350.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 0    | 03 January 2024  |           | 262.5           | 87.5          | 0.0      | 0.0  | 0.0       | 87.5  | 75.88 | 0.0        | 75.88 | 11.62       |
      |    |      | 05 January 2024  |           | 200.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 2  | 0    | 05 January 2024  |           | 412.5           | 50.0          | 0.0      | 0.0  | 0.0       | 50.0  | 0.0   | 0.0        | 0.0   | 50.0        |
      | 3  | 31   | 03 February 2024 |           | 345.37          | 67.13         | 4.03     | 0.0  | 0.0       | 71.16 | 0.0   | 0.0        | 0.0   | 71.16       |
      | 4  | 29   | 03 March 2024    |           | 277.66          | 67.71         | 3.45     | 0.0  | 0.0       | 71.16 | 0.0   | 0.0        | 0.0   | 71.16       |
      | 5  | 31   | 03 April 2024    |           | 209.28          | 68.38         | 2.78     | 0.0  | 0.0       | 71.16 | 0.0   | 0.0        | 0.0   | 71.16       |
      | 6  | 30   | 03 May 2024      |           | 140.21          | 69.07         | 2.09     | 0.0  | 0.0       | 71.16 | 0.0   | 0.0        | 0.0   | 71.16       |
      | 7  | 31   | 03 June 2024     |           | 70.45           | 69.76         | 1.4      | 0.0  | 0.0       | 71.16 | 0.0   | 0.0        | 0.0   | 71.16       |
      | 8  | 30   | 03 July 2024     |           | 0.0             | 70.45         | 0.7      | 0.0  | 0.0       | 71.15 | 0.0   | 0.0        | 0.0   | 71.15       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late  | Outstanding |
      | 550.0         | 14.45    | 0.0  | 0.0       | 564.45 | 75.88 | 0.0        | 75.88 | 488.57      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 350.0  | 0.0       | 0.0      | 0.0  | 0.0       | 350.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 200.0  | 0.0       | 0.0      | 0.0  | 0.0       | 550.0        | false    | false    |
      | 05 January 2024  | Repayment        | 50.0   | 50.0      | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 February 2024 | Repayment        | 25.88  | 25.88     | 0.0      | 0.0  | 0.0       | 474.12       | false    | true     |

  @TestRailId:C3226
  Scenario: Verify interest recalculation in case of overdue installments: UC1 - 1st installment overdue, interest recalculation: daily, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment overdue ---
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.09           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.47           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.75           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.94           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.94         | 0.1      | 0.0  | 0.0       | 17.04 | 0.0  | 0.0        | 0.0  | 17.04       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.09     | 0.0  | 0.0       | 102.09 | 0.0  | 0.0        | 0.0  | 102.09      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 14 February 2024 | Accrual          | 0.84   | 0.0       | 0.84     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3227
  Scenario: Verify interest recalculation in case of overdue installments: UC2 - 1st installment overdue, interest recalculation: daily, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment overdue ---
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.09           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.47           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.75           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.94           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.94         | 0.1      | 0.0  | 0.0       | 17.04 | 0.0  | 0.0        | 0.0  | 17.04       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.09     | 0.0  | 0.0       | 102.09 | 0.0  | 0.0        | 0.0  | 102.09      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 14 February 2024 | Accrual          | 0.84   | 0.0       | 0.84     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3228
  Scenario: Verify interest recalculation in case of overdue installments: UC3 - 1st installment overdue, interest recalculation: same as repayment period, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment overdue ---
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.14           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.52           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.8            | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.99           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.99         | 0.1      | 0.0  | 0.0       | 17.09 | 0.0  | 0.0        | 0.0  | 17.09       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.14     | 0.0  | 0.0       | 102.14 | 0.0  | 0.0        | 0.0  | 102.14      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 14 February 2024 | Accrual          | 0.84   | 0.0       | 0.84     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3229
  Scenario: Verify interest recalculation in case of overdue installments: UC4 - 1st installment overdue, interest recalculation: same as repayment period, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                  | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment overdue ---
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.14           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.52           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.8            | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.99           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.99         | 0.1      | 0.0  | 0.0       | 17.09 | 0.0  | 0.0        | 0.0  | 17.09       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.14     | 0.0  | 0.0       | 102.14 | 0.0  | 0.0        | 0.0  | 102.14      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 14 February 2024 | Accrual          | 0.84   | 0.0       | 0.84     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3230
  Scenario: Verify interest recalculation in case of overdue installments: UC5 - 1st and 2nd installment overdue, interest recalculation: daily, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st and 2nd installment overdue ---
    When Admin sets the business date to "01 Feb 2024"
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.14           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.58           | 16.56         | 0.45     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.87           | 16.71         | 0.3      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 17.06           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.06         | 0.1      | 0.0  | 0.0       | 17.16 | 0.0  | 0.0        | 0.0  | 17.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.21     | 0.0  | 0.0       | 102.21 | 0.0  | 0.0        | 0.0  | 102.21      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 31 January 2024  | Accrual          | 0.56   | 0.0       | 0.56     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 March 2024    | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3231
  Scenario: Verify interest recalculation in case of overdue installments: UC6 - 1st and 2nd installment overdue, interest recalculation: daily, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st and 2nd installment overdue ---
    When Admin sets the business date to "01 Feb 2024"
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.14           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.58           | 16.56         | 0.45     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.87           | 16.71         | 0.3      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 17.06           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.06         | 0.1      | 0.0  | 0.0       | 17.16 | 0.0  | 0.0        | 0.0  | 17.16       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.21     | 0.0  | 0.0       | 102.21 | 0.0  | 0.0        | 0.0  | 102.21      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 31 January 2024  | Accrual          | 0.56   | 0.0       | 0.56     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 March 2024    | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3232
  Scenario: Verify interest recalculation in case of overdue installments: UC7 - 1st and 2nd installment overdue, interest recalculation: same as repayment period, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st and 2nd installment overdue ---
    When Admin sets the business date to "01 Feb 2024"
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.14           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.71           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 34.0            | 16.71         | 0.3      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 17.19           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.19         | 0.1      | 0.0  | 0.0       | 17.29 | 0.0  | 0.0        | 0.0  | 17.29       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.34     | 0.0  | 0.0       | 102.34 | 0.0  | 0.0        | 0.0  | 102.34      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 31 January 2024  | Accrual          | 0.56   | 0.0       | 0.56     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 March 2024    | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3233
  Scenario: Verify interest recalculation in case of overdue installments: UC8 - 1st and 2nd installment overdue, interest recalculation: same as repayment period, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                  | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st and 2nd installment overdue ---
    When Admin sets the business date to "01 Feb 2024"
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.14           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.71           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 34.0            | 16.71         | 0.3      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 17.19           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 17.19         | 0.1      | 0.0  | 0.0       | 17.29 | 0.0  | 0.0        | 0.0  | 17.29       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.34     | 0.0  | 0.0       | 102.34 | 0.0  | 0.0        | 0.0  | 102.34      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 31 January 2024  | Accrual          | 0.56   | 0.0       | 0.56     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 March 2024    | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 March 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3234
  Scenario: Verify interest recalculation in case of overdue installments: UC9 - 1st installment paid on due date, 2nd installment overdue, interest recalculation: daily, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.46           | 16.59         | 0.42     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.74           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.93           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.93         | 0.1      | 0.0  | 0.0       | 17.03 | 0.0   | 0.0        | 0.0  | 17.03       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.08     | 0.0  | 0.0       | 102.08 | 17.01 | 0.0        | 0.0  | 85.07       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.2    | 0.0       | 1.2      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3235
  Scenario: Verify interest recalculation in case of overdue installments: UC10 - 1st installment paid on due date, 2nd installment overdue, interest recalculation: daily, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.46           | 16.59         | 0.42     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.74           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.93           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.93         | 0.1      | 0.0  | 0.0       | 17.03 | 0.0   | 0.0        | 0.0  | 17.03       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.08     | 0.0  | 0.0       | 102.08 | 17.01 | 0.0        | 0.0  | 85.07       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.2    | 0.0       | 1.2      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3236
  Scenario: Verify interest recalculation in case of overdue installments: UC11 - 1st installment paid on due date, 2nd installment overdue, interest recalculation: same as repayment period, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.53           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.81           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.1      | 0.0  | 0.0       | 17.1  | 0.0   | 0.0        | 0.0  | 17.1        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.15     | 0.0  | 0.0       | 102.15 | 17.01 | 0.0        | 0.0  | 85.14       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.2    | 0.0       | 1.2      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3237
  Scenario: Verify interest recalculation in case of overdue installments: UC12 - 1st installment paid on due date, 2nd installment overdue, interest recalculation: same as repayment period, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                  | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.53           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.81           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.1      | 0.0  | 0.0       | 17.1  | 0.0   | 0.0        | 0.0  | 17.1        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.15     | 0.0  | 0.0       | 102.15 | 17.01 | 0.0        | 0.0  | 85.14       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.2    | 0.0       | 1.2      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3238
  Scenario: Verify interest recalculation in case of overdue installments: UC13 - 1st installment paid on due date, 2nd installment overdue with partial late repayment, interest recalculation: daily, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#  --- 2nd installment paid partially and late ---
    When Admin sets the business date to "05 March 2024"
    And Customer makes "AUTOPAY" repayment on "05 March 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.44           | 16.61         | 0.4      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.72           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.91           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.91         | 0.1      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.06     | 0.0  | 0.0       | 102.06 | 27.01 | 0.0        | 10.0 | 75.05       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.45           | 16.6          | 0.41     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.73           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.92           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.92         | 0.1      | 0.0  | 0.0       | 17.02 | 0.0   | 0.0        | 0.0  | 17.02       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.07     | 0.0  | 0.0       | 102.07 | 27.01 | 0.0        | 10.0 | 75.06       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.19   | 0.0       | 1.19     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3239
  Scenario: Verify interest recalculation in case of overdue installments: UC14 - 1st installment paid on due date, 2nd installment overdue with partial late repayment, interest recalculation: daily, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#  --- 2nd installment paid partially and late ---
    When Admin sets the business date to "05 March 2024"
    And Customer makes "AUTOPAY" repayment on "05 March 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.44           | 16.61         | 0.4      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.72           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.91           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.91         | 0.1      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.06     | 0.0  | 0.0       | 102.06 | 27.01 | 0.0        | 10.0 | 75.05       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.45           | 16.6          | 0.41     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.73           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.92           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.92         | 0.1      | 0.0  | 0.0       | 17.02 | 0.0   | 0.0        | 0.0  | 17.02       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.07     | 0.0  | 0.0       | 102.07 | 27.01 | 0.0        | 10.0 | 75.06       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.19   | 0.0       | 1.19     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3240
  Scenario: Verify interest recalculation in case of overdue installments: UC15 - 1st installment paid on due date, 2nd installment overdue, interest recalculation: same as repayment period, till preclose
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                       | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#    --- 2nd installment paid partially and late ---
    When Admin sets the business date to "05 March 2024"
    And Customer makes "AUTOPAY" repayment on "05 March 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.53           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.81           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.1      | 0.0  | 0.0       | 17.1  | 0.0   | 0.0        | 0.0  | 17.1        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.15     | 0.0  | 0.0       | 102.15 | 27.01 | 0.0        | 10.0 | 75.14       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.53           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.81           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.1      | 0.0  | 0.0       | 17.1  | 0.0   | 0.0        | 0.0  | 17.1        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.15     | 0.0  | 0.0       | 102.15 | 27.01 | 0.0        | 10.0 | 75.14       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.2    | 0.0       | 1.2      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3241
  Scenario: Verify interest recalculation in case of overdue installments: UC16 - 1st installment paid on due date, 2nd installment overdue, interest recalculation: same as repayment period, till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                  | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_SARP_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 0.0  | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
#    --- 2nd installment paid partially and late ---
    When Admin sets the business date to "05 March 2024"
    And Customer makes "AUTOPAY" repayment on "05 March 2024" with 10 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.53           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.81           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.1      | 0.0  | 0.0       | 17.1  | 0.0   | 0.0        | 0.0  | 17.1        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.15     | 0.0  | 0.0       | 102.15 | 27.01 | 0.0        | 10.0 | 75.14       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
#  --- 2nd installment overdue ---
    When Admin sets the business date to "10 March 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 10.0  | 0.0        | 10.0 | 7.01        |
      | 3  | 31   | 01 April 2024    |                  | 50.53           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.81           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 17.0            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 17.0          | 0.1      | 0.0  | 0.0       | 17.1  | 0.0   | 0.0        | 0.0  | 17.1        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.15     | 0.0  | 0.0       | 102.15 | 27.01 | 0.0        | 10.0 | 75.14       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |
      | 05 March 2024    | Repayment        | 10.0   | 10.0      | 0.0      | 0.0  | 0.0       | 73.57        | false    | false    |
      | 09 March 2024    | Accrual          | 1.2    | 0.0       | 1.2      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3244
  Scenario: Verify support of interest rate calculation with frequency Whole term  configured for progressive loan
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_WHOLE_TERM | 01 January 2024   | 100            | 4                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 75.37           | 24.63         | 1.0      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 2  | 29   | 01 March 2024    |           | 50.49           | 24.88         | 0.75     | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 3  | 31   | 01 April 2024    |           | 25.36           | 25.13         | 0.5      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 25.36         | 0.25     | 0.0  | 0.0       | 25.61 | 0.0  | 0.0        | 0.0  | 25.61       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100           | 2.50     | 0.0  | 0.0       | 102.50 | 0.0  | 0.0        | 0.0  | 102.50      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
    Then Loan Transactions tab has a "DISBURSEMENT" transaction with date "01 January 2024" which has the following Journal entries:
      | Type      | Account code | Account name              | Debit | Credit |
      | ASSET     | 112601       | Loans Receivable          | 100.0 |        |
      | LIABILITY | 145023       | Suspense/Clearing account |       | 100.0  |
#  -- create other progressive loan with 12% interest rate and frequency PerYear to check that data should match for both loans
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 75.37           | 24.63         | 1.0      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 2  | 29   | 01 March 2024    |           | 50.49           | 24.88         | 0.75     | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 3  | 31   | 01 April 2024    |           | 25.36           | 25.13         | 0.5      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 25.36         | 0.25     | 0.0  | 0.0       | 25.61 | 0.0  | 0.0        | 0.0  | 25.61       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100           | 2.50     | 0.0  | 0.0       | 102.50 | 0.0  | 0.0        | 0.0  | 102.50      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
    Then Loan Transactions tab has a "DISBURSEMENT" transaction with date "01 January 2024" which has the following Journal entries:
      | Type      | Account code | Account name              | Debit | Credit |
      | ASSET     | 112601       | Loans Receivable          | 100.0 |        |
      | LIABILITY | 145023       | Suspense/Clearing account |       | 100.0  |

  @TestRailId:C3287
  Scenario: Verify support of interest rate calculation with frequency Whole term  configured for progressive loan on loan account level
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with interestRateFrequencyType and following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            | interestRateFrequencyType |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 4                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION | WHOLE_TERM                |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 75.37           | 24.63         | 1.0      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 2  | 29   | 01 March 2024    |           | 50.49           | 24.88         | 0.75     | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 3  | 31   | 01 April 2024    |           | 25.36           | 25.13         | 0.5      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 25.36         | 0.25     | 0.0  | 0.0       | 25.61 | 0.0  | 0.0        | 0.0  | 25.61       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100           | 2.50     | 0.0  | 0.0       | 102.50 | 0.0  | 0.0        | 0.0  | 102.50      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
    Then Loan Transactions tab has a "DISBURSEMENT" transaction with date "01 January 2024" which has the following Journal entries:
      | Type      | Account code | Account name              | Debit | Credit |
      | ASSET     | 112601       | Loans Receivable          | 100.0 |        |
      | LIABILITY | 145023       | Suspense/Clearing account |       | 100.0  |
#  -- create other progressive loan with 12% interest rate and frequency PerYear to check that data should match for both loans
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 75.37           | 24.63         | 1.0      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 2  | 29   | 01 March 2024    |           | 50.49           | 24.88         | 0.75     | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 3  | 31   | 01 April 2024    |           | 25.36           | 25.13         | 0.5      | 0.0  | 0.0       | 25.63 | 0.0  | 0.0        | 0.0  | 25.63       |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 25.36         | 0.25     | 0.0  | 0.0       | 25.61 | 0.0  | 0.0        | 0.0  | 25.61       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100           | 2.50     | 0.0  | 0.0       | 102.50 | 0.0  | 0.0        | 0.0  | 102.50      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        |
    Then Loan Transactions tab has a "DISBURSEMENT" transaction with date "01 January 2024" which has the following Journal entries:
      | Type      | Account code | Account name              | Debit | Credit |
      | ASSET     | 112601       | Loans Receivable          | 100.0 |        |
      | LIABILITY | 145023       | Suspense/Clearing account |       | 100.0  |

  @TestRailId:C3245
  Scenario: Verify Interest recalculation - daily for overdue loan - UC1: 360/30, pre-close on overdue loan, preClosureInterestCalculationStrategy = till pre-close date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Fully repaid between 1st and 2nd installment, 1st installment is overdue ---
    When Admin sets the business date to "15 February 2024"
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 100.86 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 66.84           | 16.73         | 0.28     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 3  | 31   | 01 April 2024    | 15 February 2024 | 49.83           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 4  | 30   | 01 May 2024      | 15 February 2024 | 32.82           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 5  | 31   | 01 June 2024     | 15 February 2024 | 15.81           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 February 2024 | 0.0             | 15.81         | 0.0      | 0.0  | 0.0       | 15.81 | 15.81 | 15.81      | 0.0   | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late  | Outstanding |
      | 100.0         | 0.86     | 0.0  | 0.0       | 100.86 | 100.86 | 83.85      | 17.01 | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 February 2024 | Repayment        | 100.86 | 100.0     | 0.86     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.86   | 0.0       | 0.86     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan's all installments have obligations met

  @TestRailId:C3246
  Scenario: Verify Interest recalculation - daily for overdue loan - UC2: 360/30, pre-close on overdue loan, preClosureInterestCalculationStrategy = till rest frequency date
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                   | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_REST_FREQUENCY_DATE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Fully repaid between 1st and 2nd installment, 1st installment is overdue ---
    When Admin sets the business date to "15 February 2024"
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 101.11 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 67.09           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 3  | 31   | 01 April 2024    | 15 February 2024 | 50.08           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 4  | 30   | 01 May 2024      | 15 February 2024 | 33.07           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 5  | 31   | 01 June 2024     | 15 February 2024 | 16.06           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 February 2024 | 0.0             | 16.06         | 0.0      | 0.0  | 0.0       | 16.06 | 16.06 | 16.06      | 0.0   | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late  | Outstanding |
      | 100.0         | 1.11     | 0.0  | 0.0       | 101.11 | 101.11 | 84.1       | 17.01 | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 February 2024 | Repayment        | 101.11 | 100.0     | 1.11     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 1.11   | 0.0       | 1.11     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan's all installments have obligations met

  @TestRailId:C3248
  Scenario: Verify interest recalculation - late repayment, adjust NEXT installment - UC1: 360/30, daily, lesser then EMI amount is paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- lesser than emi amount is paid ---
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 15 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 15.0 | 0.0        | 15.0 | 2.01        |
      | 2  | 29   | 01 March 2024    |           | 67.09           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.47           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.75           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.94           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.94         | 0.1      | 0.0  | 0.0       | 17.04 | 0.0  | 0.0        | 0.0  | 17.04       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.09     | 0.0  | 0.0       | 102.09 | 15.0 | 0.0        | 15.0 | 87.09       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 14 February 2024 | Accrual          | 0.84   | 0.0       | 0.84     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Repayment        | 15.0   | 15.0      | 0.0      | 0.0  | 0.0       | 85.0         | false    | false    |

  @TestRailId:C3249
  Scenario: Verify interest recalculation - late repayment, adjust NEXT installment - UC2: 360/30, daily, EMI amount is paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- emi amount is paid ---
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.09           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.47           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.75           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.94           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.94         | 0.1      | 0.0  | 0.0       | 17.04 | 0.0   | 0.0        | 0.0   | 17.04       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late  | Outstanding |
      | 100.0         | 2.09     | 0.0  | 0.0       | 102.09 | 17.01 | 0.0        | 17.01 | 85.08       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 14 February 2024 | Accrual          | 0.84   | 0.0       | 0.84     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |

  @TestRailId:C3250
  Scenario: Verify interest recalculation - late repayment, adjust NEXT installment - UC2: 360/30, daily, excess then EMI amount is paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- excess than emi amount is paid ---
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 34.02 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 66.84           | 16.73         | 0.28     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 3  | 31   | 01 April 2024    |                  | 50.42           | 16.42         | 0.59     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.7            | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.89           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.89         | 0.1      | 0.0  | 0.0       | 16.99 | 0.0   | 0.0        | 0.0   | 16.99       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late  | Outstanding |
      | 100.0         | 2.04     | 0.0  | 0.0       | 102.04 | 34.02 | 17.01      | 17.01 | 68.02       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 February 2024 | Repayment        | 34.02  | 33.16     | 0.86     | 0.0  | 0.0       | 66.84        | false    | false    |
      | 14 February 2024 | Accrual          | 0.84   | 0.0       | 0.84     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3267
  Scenario: Verify interest recalculation - late repayment, adjust LAST installment  - UC2: 360/30, daily, excess EMI amount is paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- lesser than emi amount is paid ---
    When Admin sets the business date to "01 February 2024"
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "15 February 2024"
    When Admin runs inline COB job for Loan
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 34.02 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.04           | 16.53         | 0.48     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.32           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.5            | 16.82         | 0.19     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 17.01           | 16.49         | 0.1      | 0.0  | 0.0       | 16.59 | 0.0   | 0.0        | 0.0   | 16.59       |
      | 6  | 30   | 01 July 2024     | 15 February 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late   | Outstanding |
      | 100.00        | 1.64     | 0.0  | 0.0       | 101.64 | 34.02 | 17.01      | 17.01  | 67.62       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 31 January 2024  | Accrual          | 0.56   | 0.0       | 0.56     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Repayment        | 34.02  | 33.44     | 0.58     | 0.0  | 0.0       | 66.56        | false    | false    |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3251
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC1: 360/30, early repayment with amount less then due interest
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 0.20 EUR - NO interest recalculation, because we did not paid any outstanding principal portion ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 0.2 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.2  | 0.2        | 0.0  | 16.81       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.2  | 0.2        | 0.0  | 101.85      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 0.2    | 0.0       | 0.2      | 0.0  | 0.0       | 100.0        | false    | false    |

  @TestRailId:C3252
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC2: 360/30, early repayment with amount 1 cent more then due interest
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 0.27 EUR, only 0.01 EUR goes for principal --> interest recalculation kicks, but effect cannot be seen ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 0.27 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.27 | 0.27       | 0.0  | 16.74       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.27 | 0.27       | 0.0  | 101.78      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 0.27   | 0.01      | 0.26     | 0.0  | 0.0       | 99.99        | false    | false    |

  @TestRailId:C3253
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC3: 360/30, early repayment with less than EMI amount
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 15.0 EUR --> interest recalculation kicks, there is enough room for remaining interest ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 15 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.52           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 15.0 | 15.0       | 0.0  | 2.01        |
      | 2  | 29   | 01 March 2024    |           | 67.0            | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.38           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0  | 0.0        | 0.0  | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 15.0 | 15.0       | 0.0  | 87.0        |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 15.0   | 14.74     | 0.26     | 0.0  | 0.0       | 85.26        | false    | false    |

  @TestRailId:C3254
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC4: 360/30, early repayment with only 1 cent less than EMI amount
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 17.0 EUR --> interest recalculation kicks, there is not enough room for remaining interest, moving to next period ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.0 | 17.0       | 0.0  | 0.01        |
      | 2  | 29   | 01 March 2024    |           | 67.0            | 16.25         | 0.76     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.38           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0  | 0.0        | 0.0  | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 17.0 | 17.0       | 0.0  | 85.0        |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.0   | 16.74     | 0.26     | 0.0  | 0.0       | 83.26        | false    | false    |

  @TestRailId:C3255
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC5: 360/30, multiple early repayments for the same installment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 15.0 EUR ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 15 EUR transaction amount
    When Admin runs inline COB job for Loan
#  --- Early repayment with 2.01 EUR ---
    When Admin sets the business date to "20 January 2024"
    And Customer makes "AUTOPAY" repayment on "20 January 2024" with 2.01 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 20 January 2024 | 83.33           | 16.67         | 0.34     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 67.0            | 16.33         | 0.68     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.38           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0   | 0.0        | 0.0  | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 17.01 | 17.01      | 0.0  | 84.99       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 15.0   | 14.74     | 0.26     | 0.0  | 0.0       | 85.26        | false    | false    |
      | 15 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 January 2024  | Repayment        | 2.01   | 1.93      | 0.08     | 0.0  | 0.0       | 83.33        | false    | false    |

  @TestRailId:C3256
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC6: 360/30, early repayment with exact EMI amount
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 17.01 EUR ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 67.0            | 16.25         | 0.76     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.38           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0   | 0.0        | 0.0  | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 17.01 | 17.01      | 0.0  | 84.99       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |

  @TestRailId:C3257
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC7: 360/30, early repayment with twice than EMI amount
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 34.02 EUR ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 34.02 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 January 2024 | 66.24           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    |                 | 50.22           | 16.02         | 0.99     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.5            | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 16.69           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.69         | 0.1      | 0.0  | 0.0       | 16.79 | 0.0   | 0.0        | 0.0  | 16.79       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.84     | 0.0  | 0.0       | 101.84 | 34.02 | 34.02      | 0.0  | 67.82       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 34.02  | 33.76     | 0.26     | 0.0  | 0.0       | 66.24        | false    | false    |

  @TestRailId:C3258
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC8: 360/30, preclose after early repayment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#   --- Early repayment with 17.01 EUR ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    When Admin runs inline COB job for Loan
#  --- Preclose with 83.33 EUR ---
    When Admin sets the business date to "20 January 2024"
    And Customer makes "AUTOPAY" repayment on "20 January 2024" with 83.33 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 20 January 2024 | 66.32           | 16.93         | 0.08     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 20 January 2024 | 49.31           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 20 January 2024 | 32.3            | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 20 January 2024 | 15.29           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 20 January 2024 | 0.0             | 15.29         | 0.0      | 0.0  | 0.0       | 15.29 | 15.29 | 15.29      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 100.0         | 0.34     | 0.0  | 0.0       | 100.34 | 100.34 | 100.34     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |
      | 20 January 2024  | Repayment        | 83.33  | 83.25     | 0.08     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 January 2024  | Accrual          | 0.1    | 0.0       | 0.1      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3259
  Scenario: Verify Interest recalculation - EARLY repayment, adjust NEXT installment - UC9: 360/30, interest modification after early repayment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                     | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 17.01 EUR ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    When Admin runs inline COB job for Loan
#   --- Interest rate changed to 4% ---
    When Admin sets the business date to "20 January 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 21 January 2024    | 20 January 2024 |                 |                  |                 |            | 4               |
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 66.86           | 16.39         | 0.47     | 0.0  | 0.0       | 16.86 | 0.0   | 0.0        | 0.0  | 16.86       |
      | 3  | 31   | 01 April 2024    |                 | 50.22           | 16.64         | 0.22     | 0.0  | 0.0       | 16.86 | 0.0   | 0.0        | 0.0  | 16.86       |
      | 4  | 30   | 01 May 2024      |                 | 33.53           | 16.69         | 0.17     | 0.0  | 0.0       | 16.86 | 0.0   | 0.0        | 0.0  | 16.86       |
      | 5  | 31   | 01 June 2024     |                 | 16.78           | 16.75         | 0.11     | 0.0  | 0.0       | 16.86 | 0.0   | 0.0        | 0.0  | 16.86       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.78         | 0.06     | 0.0  | 0.0       | 16.84 | 0.0   | 0.0        | 0.0  | 16.84       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.29     | 0.0  | 0.0       | 101.29 | 17.01 | 17.01      | 0.0  | 84.28       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |
      | 15 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "25 January 2024"
    When Admin runs inline COB job for Loan
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |
      | 15 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3269
  Scenario: UC1 - Single disbursement, full refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    When Admin sets the business date to "22 January 2024"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 750.54          | 249.46        | 5.68     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 22 January 2024 | 495.4           | 255.14        | 0.0      | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 22 January 2024 | 240.26          | 255.14        | 0.0      | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 22 January 2024 | 0.0             | 240.26        | 0.0      | 0.0  | 0.0       | 240.26 | 240.26 | 240.26     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 5.68     | 0.0  | 0.0       | 1005.68 | 1005.68 | 1005.68    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Merchant Issued Refund | 1000.0 | 994.32    | 5.68     | 0.0  | 0.0       | 5.68         | false    | false    |
      | 22 January 2024  | Interest Refund        | 5.68   | 5.68      | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2024  | Accrual                | 5.68   | 0.0       | 5.68     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3270
  Scenario: UC2 - Single disbursement, full refund after first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 255.14 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 255.14 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 504.02          | 249.23        | 5.91     | 0.0  | 0.0       | 255.14 | 0.0    | 0.0        | 0.0  | 255.14      |
      | 3  | 31   | 01 April 2024    |                  | 253.11          | 250.91        | 4.23     | 0.0  | 0.0       | 255.14 | 0.0    | 0.0        | 0.0  | 255.14      |
      | 4  | 30   | 01 May 2024      |                  | 0.0             | 253.11        | 2.05     | 0.0  | 0.0       | 255.16 | 0.0    | 0.0        | 0.0  | 255.16      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 20.58    | 0.0  | 0.0       | 1020.58 | 255.14 | 0.0        | 0.0  | 765.44      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment        | 255.14 | 246.75    | 8.39     | 0.0  | 0.0       | 753.25       | false    | false    |
    When Admin sets the business date to "09 February 2024"
    When Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "09 February 2024" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 255.14 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 499.74          | 253.51        | 1.63     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 09 February 2024 | 244.6           | 255.14        | 0.0      | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 09 February 2024 | 0.0             | 244.6         | 0.0      | 0.0  | 0.0       | 244.6  | 244.6  | 244.6      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 10.02    | 0.0  | 0.0       | 1010.02 | 1010.02 | 754.88     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment        | 255.14 | 246.75    | 8.39     | 0.0  | 0.0       | 753.25       | false    | false    |
      | 09 February 2024 | Payout Refund    | 1000.0 | 753.25    | 1.63     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Interest Refund  | 10.02  | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual          | 10.02  | 0.0       | 10.02    | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "10 February 2024"
    When Admin makes Credit Balance Refund transaction on "10 February 2024" with 255.14 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 255.14 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 499.74          | 253.51        | 1.63     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 09 February 2024 | 244.6           | 255.14        | 0.0      | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 09 February 2024 | 0.0             | 244.6         | 0.0      | 0.0  | 0.0       | 244.6  | 244.6  | 244.6      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 10.02    | 0.0  | 0.0       | 1010.02 | 1010.02 | 754.88     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type      | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement          | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment             | 255.14 | 246.75    | 8.39     | 0.0  | 0.0       | 753.25       | false    | false    |
      | 09 February 2024 | Payout Refund         | 1000.0 | 753.25    | 1.63     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Interest Refund       | 10.02  | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual               | 10.02  | 0.0       | 10.02    | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 February 2024 | Credit Balance Refund | 255.14 | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3271
  Scenario: UC3 - Multi disbursements, same day, full refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "750" EUR transaction amount
    When Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    When Admin sets the business date to "22 January 2024"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 750.53          | 249.47        | 5.68     | 0.0  | 0.0       | 255.15 | 255.15 | 255.15     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 22 January 2024 | 495.38          | 255.15        | 0.0      | 0.0  | 0.0       | 255.15 | 255.15 | 255.15     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 22 January 2024 | 240.23          | 255.15        | 0.0      | 0.0  | 0.0       | 255.15 | 255.15 | 255.15     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 22 January 2024 | 0.0             | 240.23        | 0.0      | 0.0  | 0.0       | 240.23 | 240.23 | 240.23     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 5.68     | 0.0  | 0.0       | 1005.68 | 1005.68 | 1005.68    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 750.0        | false    | false    |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Merchant Issued Refund | 1000.0 | 994.32    | 5.68     | 0.0  | 0.0       | 5.68         | false    | false    |
      | 22 January 2024  | Interest Refund        | 5.68   | 5.68      | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2024  | Accrual                | 5.68   | 0.0       | 5.68     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3272
  Scenario: UC4 - Multi disbursements, different days, full refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    When Admin sets the business date to "04 January 2024"
    When Admin successfully disburse the loan on "04 January 2024" with "750" EUR transaction amount
    When Admin sets the business date to "22 January 2024"
    When Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 04 January 2024  |                 | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 750.08          | 249.92        | 5.07     | 0.0  | 0.0       | 254.99 | 254.99 | 254.99     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 22 January 2024 | 495.09          | 254.99        | 0.0      | 0.0  | 0.0       | 254.99 | 254.99 | 254.99     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 22 January 2024 | 240.1           | 254.99        | 0.0      | 0.0  | 0.0       | 254.99 | 254.99 | 254.99     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 22 January 2024 | 0.0             | 240.1         | 0.0      | 0.0  | 0.0       | 240.1  | 240.1  | 240.1      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 5.07     | 0.0  | 0.0       | 1005.07 | 1005.07 | 1005.07    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 04 January 2024  | Disbursement     | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Payout Refund    | 1000.0 | 994.93    | 5.07     | 0.0  | 0.0       | 5.07         | false    | false    |
      | 22 January 2024  | Interest Refund  | 5.07   | 5.07      | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2024  | Accrual          | 5.07   | 0.0       | 5.07     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3273
  Scenario: UC5 - Multi disbursements, different days, full refund after first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "500" EUR transaction amount
    When Admin sets the business date to "07 January 2024"
    When Admin successfully disburse the loan on "07 January 2024" with "500" EUR transaction amount
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 255.14 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 07 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 752.63          | 247.37        | 7.57     | 0.0  | 0.0       | 254.94 | 254.94 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 503.59          | 249.04        | 5.9      | 0.0  | 0.0       | 254.94 | 0.2    | 0.2        | 0.0  | 254.74      |
      | 3  | 31   | 01 April 2024    |                  | 252.87          | 250.72        | 4.22     | 0.0  | 0.0       | 254.94 | 0.0    | 0.0        | 0.0  | 254.94      |
      | 4  | 30   | 01 May 2024      |                  | 0.0             | 252.87        | 2.05     | 0.0  | 0.0       | 254.92 | 0.0    | 0.0        | 0.0  | 254.92      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 19.74    | 0.0  | 0.0       | 1019.74 | 255.14 | 0.2        | 0.0  | 764.6       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 07 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment        | 255.14 | 247.57    | 7.57     | 0.0  | 0.0       | 752.43       | false    | false    |
    When Admin sets the business date to "09 February 2024"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "09 February 2024" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 07 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 752.63          | 247.37        | 7.57     | 0.0  | 0.0       | 254.94 | 254.94 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 499.32          | 253.31        | 1.63     | 0.0  | 0.0       | 254.94 | 254.94 | 254.94     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 09 February 2024 | 244.38          | 254.94        | 0.0      | 0.0  | 0.0       | 254.94 | 254.94 | 254.94     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 09 February 2024 | 0.0             | 244.38        | 0.0      | 0.0  | 0.0       | 244.38 | 244.38 | 244.38     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 9.2      | 0.0  | 0.0       | 1009.2 | 1009.2 | 754.26     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 07 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 255.14 | 247.57    | 7.57     | 0.0  | 0.0       | 752.43       | false    | false    |
      | 09 February 2024 | Merchant Issued Refund | 1000.0 | 752.43    | 1.63     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Interest Refund        | 9.2    | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual                | 9.2    | 0.0       | 9.2      | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "10 February 2024"
    When Admin makes Credit Balance Refund transaction on "10 February 2024" with 255.14 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 07 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 752.63          | 247.37        | 7.57     | 0.0  | 0.0       | 254.94 | 254.94 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 499.32          | 253.31        | 1.63     | 0.0  | 0.0       | 254.94 | 254.94 | 254.94     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 09 February 2024 | 244.38          | 254.94        | 0.0      | 0.0  | 0.0       | 254.94 | 254.94 | 254.94     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 09 February 2024 | 0.0             | 244.38        | 0.0      | 0.0  | 0.0       | 244.38 | 244.38 | 244.38     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 9.2      | 0.0  | 0.0       | 1009.2 | 1009.2 | 754.26     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 07 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 255.14 | 247.57    | 7.57     | 0.0  | 0.0       | 752.43       | false    | false    |
      | 09 February 2024 | Merchant Issued Refund | 1000.0 | 752.43    | 1.63     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Interest Refund        | 9.2    | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 February 2024 | Accrual                | 9.2    | 0.0       | 9.2      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 February 2024 | Credit Balance Refund  | 255.14 | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3277
  Scenario: UC6 - Single disbursement, partial refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 2  | 29   | 01 March 2024    |           | 504.02          | 249.23        | 5.91     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 3  | 31   | 01 April 2024    |           | 253.11          | 250.91        | 4.23     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 253.11        | 2.05     | 0.0  | 0.0       | 255.16 | 0.0  | 0.0        | 0.0  | 255.16      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 20.58    | 0.0  | 0.0       | 1020.58 | 0.0  | 0.0        | 0.0  | 1020.58     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Admin sets the business date to "14 February 2024"
    When Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "14 February 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late   | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |        |             |
      | 1  | 31   | 01 February 2024 | 14 February 2024 | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 255.14 | 0.0        | 255.14 | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 498.11          | 255.14        | 0.0      | 0.0  | 0.0       | 255.14 | 250.82 | 250.82     | 0.0    | 4.32        |
      | 3  | 31   | 01 April 2024    |                  | 252.84          | 245.27        | 9.87     | 0.0  | 0.0       | 255.14 | 0.0    | 0.0        | 0.0    | 255.14      |
      | 4  | 30   | 01 May 2024      |                  | 0.0             | 252.84        | 2.05     | 0.0  | 0.0       | 254.89 | 0.0    | 0.0        | 0.0    | 254.89      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late   | Outstanding |
      | 1000.0        | 20.31    | 0.0  | 0.0       | 1020.31 | 505.96 | 250.82     | 255.14 | 514.35      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 14 February 2024 | Payout Refund    | 500.0  | 491.61    | 8.39     | 0.0  | 0.0       | 508.39       | false    | false    |
      | 14 February 2024 | Interest Refund  | 5.96   | 5.96      | 0.0      | 0.0  | 0.0       | 502.43       | false    | false    |
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 4.33 EUR transaction amount
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 255.14 EUR transaction amount
    When Admin sets the business date to "01 May 2024"
    And Customer makes "AUTOPAY" repayment on "01 May 2024" with 254.88 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late   | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |        |             |
      | 1  | 31   | 01 February 2024 | 14 February 2024 | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 255.14 | 0.0        | 255.14 | 0.0         |
      | 2  | 29   | 01 March 2024    | 01 March 2024    | 498.11          | 255.14        | 0.0      | 0.0  | 0.0       | 255.14 | 255.14 | 250.82     | 0.0    | 0.0         |
      | 3  | 31   | 01 April 2024    | 01 April 2024    | 252.84          | 245.27        | 9.87     | 0.0  | 0.0       | 255.14 | 255.14 | 0.01       | 0.0    | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 May 2024      | 0.0             | 252.84        | 2.05     | 0.0  | 0.0       | 254.89 | 254.89 | 0.01       | 0.0    | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late   | Outstanding |
      | 1000.0        | 20.31    | 0.0  | 0.0       | 1020.31 | 1020.31 | 250.84     | 255.14 | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 14 February 2024 | Payout Refund    | 500.0  | 491.61    | 8.39     | 0.0  | 0.0       | 508.39       | false    | false    |
      | 14 February 2024 | Interest Refund  | 5.96   | 5.96      | 0.0      | 0.0  | 0.0       | 502.43       | false    | false    |
      | 01 March 2024    | Repayment        | 4.33   | 4.33      | 0.0      | 0.0  | 0.0       | 498.1        | false    | false    |
      | 01 April 2024    | Repayment        | 255.14 | 245.27    | 9.87     | 0.0  | 0.0       | 252.83       | false    | false    |
      | 01 May 2024      | Repayment        | 254.88 | 252.83    | 2.05     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 May 2024      | Accrual          | 20.31  | 0.0       | 20.31    | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"


  @TestRailId:C3278
  Scenario: UC7 - Single disbursement, partial refund after first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    When Admin sets the business date to "01 February 2024"
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 2  | 29   | 01 March 2024    |           | 504.02          | 249.23        | 5.91     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 3  | 31   | 01 April 2024    |           | 253.11          | 250.91        | 4.23     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 253.11        | 2.05     | 0.0  | 0.0       | 255.16 | 0.0  | 0.0        | 0.0  | 255.16      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 20.58    | 0.0  | 0.0       | 1020.58 | 0.0  | 0.0        | 0.0  | 1020.58     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 255.14 EUR transaction amount
    When Admin sets the business date to "09 February 2024"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "09 February 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 255.14 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 499.74          | 253.51        | 1.63     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    |                  | 248.11          | 251.63        | 3.51     | 0.0  | 0.0       | 255.14 | 250.15 | 250.15     | 0.0  | 4.99        |
      | 4  | 30   | 01 May 2024      |                  | 0.0             | 248.11        | 2.01     | 0.0  | 0.0       | 250.12 | 0.0    | 0.0        | 0.0  | 250.12      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 15.54    | 0.0  | 0.0       | 1015.54 | 760.43 | 505.29     | 0.0  | 255.11      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 255.14 | 246.75    | 8.39     | 0.0  | 0.0       | 753.25       | false    | false    |
      | 09 February 2024 | Merchant Issued Refund | 500.0  | 498.37    | 1.63     | 0.0  | 0.0       | 254.88       | false    | false    |
      | 09 February 2024 | Interest Refund        | 5.29   | 5.29      | 0.0      | 0.0  | 0.0       | 249.59       | false    | false    |
    When Admin sets the business date to "01 March 2024"
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 4.99 EUR transaction amount
    When Admin sets the business date to "01 May 2024"
    And Customer makes "AUTOPAY" repayment on "01 May 2024" with 250.12 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 255.14 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 499.74          | 253.51        | 1.63     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 01 April 2024    | 248.11          | 251.63        | 3.51     | 0.0  | 0.0       | 255.14 | 255.14 | 250.15     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 May 2024      | 0.0             | 248.11        | 2.01     | 0.0  | 0.0       | 250.12 | 250.12 | 0.0        | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 15.54    | 0.0  | 0.0       | 1015.54 | 1015.54 | 505.29     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 255.14 | 246.75    | 8.39     | 0.0  | 0.0       | 753.25       | false    | false    |
      | 09 February 2024 | Merchant Issued Refund | 500.0  | 498.37    | 1.63     | 0.0  | 0.0       | 254.88       | false    | false    |
      | 09 February 2024 | Interest Refund        | 5.29   | 5.29      | 0.0      | 0.0  | 0.0       | 249.59       | false    | false    |
      | 01 April 2024    | Repayment              | 4.99   | 1.48      | 3.51     | 0.0  | 0.0       | 248.11       | false    | false    |
      | 01 May 2024      | Repayment              | 250.12 | 248.11    | 2.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 May 2024      | Accrual                | 15.54  | 0.0       | 15.54    | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3279
  Scenario: UC8 - Multi disbursements, same days, partial refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    When Admin successfully disburse the loan on "01 January 2024" with "750" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 250.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      |    |      | 01 January 2024  |           | 750.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 753.24          | 246.76        | 8.39     | 0.0  | 0.0       | 255.15 | 0.0  | 0.0        | 0.0  | 255.15      |
      | 2  | 29   | 01 March 2024    |           | 504.0           | 249.24        | 5.91     | 0.0  | 0.0       | 255.15 | 0.0  | 0.0        | 0.0  | 255.15      |
      | 3  | 31   | 01 April 2024    |           | 253.08          | 250.92        | 4.23     | 0.0  | 0.0       | 255.15 | 0.0  | 0.0        | 0.0  | 255.15      |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 253.08        | 2.05     | 0.0  | 0.0       | 255.13 | 0.0  | 0.0        | 0.0  | 255.13      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 20.58    | 0.0  | 0.0       | 1020.58 | 0.0  | 0.0        | 0.0  | 1020.58     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement     | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Admin sets the business date to "22 January 2024"
    When Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                 | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 750.53          | 249.47        | 5.68     | 0.0  | 0.0       | 255.15 | 255.15 | 255.15     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 500.68          | 249.85        | 5.3      | 0.0  | 0.0       | 255.15 | 247.69 | 247.69     | 0.0  | 7.46        |
      | 3  | 31   | 01 April 2024    |                 | 249.73          | 250.95        | 4.2      | 0.0  | 0.0       | 255.15 | 0.0    | 0.0        | 0.0  | 255.15      |
      | 4  | 30   | 01 May 2024      |                 | 0.0             | 249.73        | 2.03     | 0.0  | 0.0       | 251.76 | 0.0    | 0.0        | 0.0  | 251.76      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 17.21    | 0.0  | 0.0       | 1017.21 | 502.84 | 502.84     | 0.0  | 514.37      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement     | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Payout Refund    | 500.0  | 494.32    | 5.68     | 0.0  | 0.0       | 505.68       | false    | false    |
      | 22 January 2024  | Interest Refund  | 2.84   | 2.84      | 0.0      | 0.0  | 0.0       | 502.84       | false    | false    |
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 7.46 EUR transaction amount
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 255.15 EUR transaction amount
    When Admin sets the business date to "01 May 2024"
    And Customer makes "AUTOPAY" repayment on "01 May 2024" with 251.76 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                 | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 750.53          | 249.47        | 5.68     | 0.0  | 0.0       | 255.15 | 255.15 | 255.15     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 01 March 2024   | 500.68          | 249.85        | 5.3      | 0.0  | 0.0       | 255.15 | 255.15 | 247.69     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 01 April 2024   | 249.73          | 250.95        | 4.2      | 0.0  | 0.0       | 255.15 | 255.15 | 0.0        | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 May 2024     | 0.0             | 249.73        | 2.03     | 0.0  | 0.0       | 251.76 | 251.76 | 0.0        | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 17.21    | 0.0  | 0.0       | 1017.21 | 1017.21 | 502.84     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement     | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Payout Refund    | 500.0  | 494.32    | 5.68     | 0.0  | 0.0       | 505.68       | false    | false    |
      | 22 January 2024  | Interest Refund  | 2.84   | 2.84      | 0.0      | 0.0  | 0.0       | 502.84       | false    | false    |
      | 01 March 2024    | Repayment        | 7.46   | 2.16      | 5.3      | 0.0  | 0.0       | 500.68       | false    | false    |
      | 01 April 2024    | Repayment        | 255.15 | 250.95    | 4.2      | 0.0  | 0.0       | 249.73       | false    | false    |
      | 01 May 2024      | Repayment        | 251.76 | 249.73    | 2.03     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 May 2024      | Accrual          | 17.21  | 0.0       | 17.21    | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3280
  Scenario: UC9 - Multi disbursements, different days, partial refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    When Admin sets the business date to "07 January 2024"
    When Admin successfully disburse the loan on "07 January 2024" with "750" EUR transaction amount
    When Admin sets the business date to "22 January 2024"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 07 January 2024  |                 | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 749.63          | 250.37        | 4.47     | 0.0  | 0.0       | 254.84 | 254.84 | 254.84     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 500.09          | 249.54        | 5.3      | 0.0  | 0.0       | 254.84 | 247.6  | 247.6      | 0.0  | 7.24        |
      | 3  | 31   | 01 April 2024    |                 | 249.44          | 250.65        | 4.19     | 0.0  | 0.0       | 254.84 | 0.0    | 0.0        | 0.0  | 254.84      |
      | 4  | 30   | 01 May 2024      |                 | 0.0             | 249.44        | 2.02     | 0.0  | 0.0       | 251.46 | 0.0    | 0.0        | 0.0  | 251.46      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 15.98    | 0.0  | 0.0       | 1015.98 | 502.44 | 502.44     | 0.0  | 513.54      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 07 January 2024  | Disbursement           | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Merchant Issued Refund | 500.0  | 495.53    | 4.47     | 0.0  | 0.0       | 504.47       | false    | false    |
      | 22 January 2024  | Interest Refund        | 2.44   | 2.44      | 0.0      | 0.0  | 0.0       | 502.03       | false    | false    |
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 7.24 EUR transaction amount
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 254.84 EUR transaction amount
    When Admin sets the business date to "01 May 2024"
    And Customer makes "AUTOPAY" repayment on "01 May 2024" with 251.46 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 07 January 2024  |                 | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 749.63          | 250.37        | 4.47     | 0.0  | 0.0       | 254.84 | 254.84 | 254.84     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 01 March 2024   | 500.09          | 249.54        | 5.3      | 0.0  | 0.0       | 254.84 | 254.84 | 247.6      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 01 April 2024   | 249.44          | 250.65        | 4.19     | 0.0  | 0.0       | 254.84 | 254.84 | 0.0        | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 May 2024     | 0.0             | 249.44        | 2.02     | 0.0  | 0.0       | 251.46 | 251.46 | 0.0        | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 15.98    | 0.0  | 0.0       | 1015.98 | 1015.98 | 502.44     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 07 January 2024  | Disbursement           | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Merchant Issued Refund | 500.0  | 495.53    | 4.47     | 0.0  | 0.0       | 504.47       | false    | false    |
      | 22 January 2024  | Interest Refund        | 2.44   | 2.44      | 0.0      | 0.0  | 0.0       | 502.03       | false    | false    |
      | 01 March 2024    | Repayment              | 7.24   | 1.94      | 5.3      | 0.0  | 0.0       | 500.09       | false    | false    |
      | 01 April 2024    | Repayment              | 254.84 | 250.65    | 4.19     | 0.0  | 0.0       | 249.44       | false    | false    |
      | 01 May 2024      | Repayment              | 251.46 | 249.44    | 2.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 May 2024      | Accrual                | 15.98  | 0.0       | 15.98    | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3281
  Scenario: UC10 - Multi disbursements, different days, partial refund after all installments are paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    When Admin sets the business date to "07 January 2024"
    When Admin successfully disburse the loan on "07 January 2024" with "750" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 250.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      |    |      | 07 January 2024  |           | 750.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 752.33          | 247.67        | 7.17     | 0.0  | 0.0       | 254.84 | 0.0  | 0.0        | 0.0  | 254.84      |
      | 2  | 29   | 01 March 2024    |           | 503.39          | 248.94        | 5.9      | 0.0  | 0.0       | 254.84 | 0.0  | 0.0        | 0.0  | 254.84      |
      | 3  | 31   | 01 April 2024    |           | 252.77          | 250.62        | 4.22     | 0.0  | 0.0       | 254.84 | 0.0  | 0.0        | 0.0  | 254.84      |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 252.77        | 2.05     | 0.0  | 0.0       | 254.82 | 0.0  | 0.0        | 0.0  | 254.82      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 19.34    | 0.0  | 0.0       | 1019.34 | 0.0  | 0.0        | 0.0  | 1019.34     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 07 January 2024  | Disbursement     | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 254.84 EUR transaction amount
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 254.84 EUR transaction amount
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 254.84 EUR transaction amount
    When Admin sets the business date to "01 May 2024"
    And Customer makes "AUTOPAY" repayment on "01 May 2024" with 254.82 EUR transaction amount
    When Admin sets the business date to "10 May 2024"
    When Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "10 May 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 07 January 2024  |                  | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 752.33          | 247.67        | 7.17     | 0.0  | 0.0       | 254.84 | 254.84 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 01 March 2024    | 503.39          | 248.94        | 5.9      | 0.0  | 0.0       | 254.84 | 254.84 | 0.0        | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 01 April 2024    | 252.77          | 250.62        | 4.22     | 0.0  | 0.0       | 254.84 | 254.84 | 0.0        | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 May 2024      | 0.0             | 252.77        | 2.05     | 0.0  | 0.0       | 254.82 | 254.82 | 0.0        | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 19.34    | 0.0  | 0.0       | 1019.34 | 1019.34 | 0.0        | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 07 January 2024  | Disbursement     | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment        | 254.84 | 247.67    | 7.17     | 0.0  | 0.0       | 752.33       | false    | false    |
      | 01 March 2024    | Repayment        | 254.84 | 248.94    | 5.9      | 0.0  | 0.0       | 503.39       | false    | false    |
      | 01 April 2024    | Repayment        | 254.84 | 250.62    | 4.22     | 0.0  | 0.0       | 252.77       | false    | false    |
      | 01 May 2024      | Repayment        | 254.82 | 252.77    | 2.05     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 May 2024      | Accrual          | 19.34  | 0.0       | 19.34    | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 May 2024      | Payout Refund    | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 May 2024      | Interest Refund  | 14.01  | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "11 May 2024"
    When Admin makes Credit Balance Refund transaction on "11 May 2024" with 514.01 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 07 January 2024  |                  | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 752.33          | 247.67        | 7.17     | 0.0  | 0.0       | 254.84 | 254.84 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 01 March 2024    | 503.39          | 248.94        | 5.9      | 0.0  | 0.0       | 254.84 | 254.84 | 0.0        | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 01 April 2024    | 252.77          | 250.62        | 4.22     | 0.0  | 0.0       | 254.84 | 254.84 | 0.0        | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 May 2024      | 0.0             | 252.77        | 2.05     | 0.0  | 0.0       | 254.82 | 254.82 | 0.0        | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 19.34    | 0.0  | 0.0       | 1019.34 | 1019.34 | 0.0        | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type      | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement          | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 07 January 2024  | Disbursement          | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment             | 254.84 | 247.67    | 7.17     | 0.0  | 0.0       | 752.33       | false    | false    |
      | 01 March 2024    | Repayment             | 254.84 | 248.94    | 5.9      | 0.0  | 0.0       | 503.39       | false    | false    |
      | 01 April 2024    | Repayment             | 254.84 | 250.62    | 4.22     | 0.0  | 0.0       | 252.77       | false    | false    |
      | 01 May 2024      | Repayment             | 254.82 | 252.77    | 2.05     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 May 2024      | Accrual               | 19.34  | 0.0       | 19.34    | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 May 2024      | Payout Refund         | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 May 2024      | Interest Refund       | 14.01  | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 May 2024      | Credit Balance Refund | 514.01 | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3304
  Scenario: UC11 - Single disbursement, multiple partial refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    When Admin sets the business date to "14 January 2024"
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 753.25          | 246.75        | 8.39     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 2  | 29   | 01 March 2024    |           | 504.02          | 249.23        | 5.91     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 3  | 31   | 01 April 2024    |           | 253.11          | 250.91        | 4.23     | 0.0  | 0.0       | 255.14 | 0.0  | 0.0        | 0.0  | 255.14      |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 253.11        | 2.05     | 0.0  | 0.0       | 255.16 | 0.0  | 0.0        | 0.0  | 255.16      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 20.58    | 0.0  | 0.0       | 1020.58 | 0.0  | 0.0        | 0.0  | 1020.58     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "14 January 2024" with 500 EUR transaction amount and system-generated Idempotency key
    When Admin sets the business date to "22 January 2024"
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 14 January 2024 | 748.38          | 251.62        | 3.52     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 499.62          | 248.76        | 6.38     | 0.0  | 0.0       | 255.14 | 246.62 | 246.62     | 0.0  | 8.52        |
      | 3  | 31   | 01 April 2024    |                 | 248.67          | 250.95        | 4.19     | 0.0  | 0.0       | 255.14 | 0.0    | 0.0        | 0.0  | 255.14      |
      | 4  | 30   | 01 May 2024      |                 | 0.0             | 248.67        | 2.02     | 0.0  | 0.0       | 250.69 | 0.0    | 0.0        | 0.0  | 250.69      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 16.11    | 0.0  | 0.0       | 1016.11 | 501.76 | 501.76     | 0.0  | 514.35      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 14 January 2024  | Merchant Issued Refund | 500.0  | 496.48    | 3.52     | 0.0  | 0.0       | 503.52       | false    | false    |
      | 14 January 2024  | Interest Refund        | 1.76   | 1.76      | 0.0      | 0.0  | 0.0       | 501.76       | false    | false    |
    When Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 14 January 2024 | 748.38          | 251.62        | 3.52     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 22 January 2024 | 494.33          | 254.05        | 1.09     | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 22 January 2024 | 239.19          | 255.14        | 0.0      | 0.0  | 0.0       | 255.14 | 255.14 | 255.14     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 22 January 2024 | 0.0             | 239.19        | 0.0      | 0.0  | 0.0       | 239.19 | 239.19 | 239.19     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 4.61     | 0.0  | 0.0       | 1004.61 | 1004.61 | 1004.61    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 14 January 2024  | Merchant Issued Refund | 500.0  | 496.48    | 3.52     | 0.0  | 0.0       | 503.52       | false    | false    |
      | 14 January 2024  | Interest Refund        | 1.76   | 1.76      | 0.0      | 0.0  | 0.0       | 501.76       | false    | false    |
      | 22 January 2024  | Payout Refund          | 500.0  | 498.91    | 1.09     | 0.0  | 0.0       | 2.85         | false    | false    |
      | 22 January 2024  | Interest Refund        | 2.85   | 2.85      | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2024  | Accrual                | 4.61   | 0.0       | 4.61     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3305
  Scenario: UC12 - Single disbursement, multiple partial refund after first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 836.9           | 163.1         | 8.39     | 0.0  | 0.0       | 171.49 | 0.0  | 0.0        | 0.0  | 171.49      |
      | 2  | 29   | 01 March 2024    |           | 671.97          | 164.93        | 6.56     | 0.0  | 0.0       | 171.49 | 0.0  | 0.0        | 0.0  | 171.49      |
      | 3  | 31   | 01 April 2024    |           | 506.11          | 165.86        | 5.63     | 0.0  | 0.0       | 171.49 | 0.0  | 0.0        | 0.0  | 171.49      |
      | 4  | 30   | 01 May 2024      |           | 338.73          | 167.38        | 4.11     | 0.0  | 0.0       | 171.49 | 0.0  | 0.0        | 0.0  | 171.49      |
      | 5  | 31   | 01 June 2024     |           | 170.08          | 168.65        | 2.84     | 0.0  | 0.0       | 171.49 | 0.0  | 0.0        | 0.0  | 171.49      |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 170.08        | 1.38     | 0.0  | 0.0       | 171.46 | 0.0  | 0.0        | 0.0  | 171.46      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 28.91    | 0.0  | 0.0       | 1028.91 | 0.0  | 0.0        | 0.0  | 1028.91     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 171.49 EUR transaction amount
    When Admin sets the business date to "09 February 2024"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "09 February 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.9           | 163.1         | 8.39     | 0.0  | 0.0       | 171.49 | 171.49 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 667.22          | 169.68        | 1.81     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 09 February 2024 | 495.73          | 171.49        | 0.0      | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      |                  | 331.64          | 164.09        | 7.4      | 0.0  | 0.0       | 171.49 | 162.31 | 162.31     | 0.0  | 9.18        |
      | 5  | 31   | 01 June 2024     |                  | 162.93          | 168.71        | 2.78     | 0.0  | 0.0       | 171.49 | 0.0    | 0.0        | 0.0  | 171.49      |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 162.93        | 1.32     | 0.0  | 0.0       | 164.25 | 0.0    | 0.0        | 0.0  | 164.25      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 21.7     | 0.0  | 0.0       | 1021.7 | 676.78 | 505.29     | 0.0  | 344.92      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 171.49 | 163.1     | 8.39     | 0.0  | 0.0       | 836.9        | false    | false    |
      | 09 February 2024 | Merchant Issued Refund | 500.0  | 498.19    | 1.81     | 0.0  | 0.0       | 338.71       | false    | false    |
      | 09 February 2024 | Interest Refund        | 5.29   | 5.29      | 0.0      | 0.0  | 0.0       | 333.42       | false    | false    |
    When Admin sets the business date to "25 February 2024"
    When Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "25 February 2024" with 250 EUR transaction amount and system-generated Idempotency key
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 81.24 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.9           | 163.1         | 8.39     | 0.0  | 0.0       | 171.49 | 171.49 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 09 February 2024 | 667.22          | 169.68        | 1.81     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 09 February 2024 | 495.73          | 171.49        | 0.0      | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 25 February 2024 | 325.68          | 170.05        | 1.44     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 25 February 2024 | 154.19          | 171.49        | 0.0      | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 01 March 2024    | 0.0             | 154.19        | 0.11     | 0.0  | 0.0       | 154.3  | 154.3  | 154.3      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 11.75    | 0.0  | 0.0       | 1011.75 | 1011.75 | 840.26     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 171.49 | 163.1     | 8.39     | 0.0  | 0.0       | 836.9        | false    | false    |
      | 09 February 2024 | Merchant Issued Refund | 500.0  | 498.19    | 1.81     | 0.0  | 0.0       | 338.71       | false    | false    |
      | 09 February 2024 | Interest Refund        | 5.29   | 5.29      | 0.0      | 0.0  | 0.0       | 333.42       | false    | false    |
      | 25 February 2024 | Payout Refund          | 250.0  | 248.56    | 1.44     | 0.0  | 0.0       | 84.86        | false    | false    |
      | 25 February 2024 | Interest Refund        | 3.73   | 3.73      | 0.0      | 0.0  | 0.0       | 81.13        | false    | false    |
      | 01 March 2024    | Repayment              | 81.24  | 81.13     | 0.11     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 March 2024    | Accrual                | 11.75  | 0.0       | 11.75    | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3306
  Scenario: UC13 - Multi disbursements, same days, multiple partial refund within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    And Admin successfully disburse the loan on "01 January 2024" with "750" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 250.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      |    |      | 01 January 2024  |           | 750.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 836.91          | 163.09        | 8.39     | 0.0  | 0.0       | 171.48 | 0.0  | 0.0        | 0.0  | 171.48      |
      | 2  | 29   | 01 March 2024    |           | 671.99          | 164.92        | 6.56     | 0.0  | 0.0       | 171.48 | 0.0  | 0.0        | 0.0  | 171.48      |
      | 3  | 31   | 01 April 2024    |           | 506.14          | 165.85        | 5.63     | 0.0  | 0.0       | 171.48 | 0.0  | 0.0        | 0.0  | 171.48      |
      | 4  | 30   | 01 May 2024      |           | 338.77          | 167.37        | 4.11     | 0.0  | 0.0       | 171.48 | 0.0  | 0.0        | 0.0  | 171.48      |
      | 5  | 31   | 01 June 2024     |           | 170.13          | 168.64        | 2.84     | 0.0  | 0.0       | 171.48 | 0.0  | 0.0        | 0.0  | 171.48      |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 170.13        | 1.38     | 0.0  | 0.0       | 171.51 | 0.0  | 0.0        | 0.0  | 171.51      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 28.91    | 0.0  | 0.0       | 1028.91 | 0.0  | 0.0        | 0.0  | 1028.91     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement     | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Admin sets the business date to "22 January 2024"
    And Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 500 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                 | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 834.2           | 165.8         | 5.68     | 0.0  | 0.0       | 171.48 | 171.48 | 171.48     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 22 January 2024 | 662.72          | 171.48        | 0.0      | 0.0  | 0.0       | 171.48 | 171.48 | 171.48     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    |                 | 500.76          | 161.96        | 9.52     | 0.0  | 0.0       | 171.48 | 159.88 | 159.88     | 0.0  | 11.6        |
      | 4  | 30   | 01 May 2024      |                 | 333.34          | 167.42        | 4.06     | 0.0  | 0.0       | 171.48 | 0.0    | 0.0        | 0.0  | 171.48      |
      | 5  | 31   | 01 June 2024     |                 | 164.66          | 168.68        | 2.8      | 0.0  | 0.0       | 171.48 | 0.0    | 0.0        | 0.0  | 171.48      |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 164.66        | 1.34     | 0.0  | 0.0       | 166.0  | 0.0    | 0.0        | 0.0  | 166.0       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 23.4     | 0.0  | 0.0       | 1023.4 | 502.84 | 502.84     | 0.0  | 520.56      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement           | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Merchant Issued Refund | 500.0  | 494.32    | 5.68     | 0.0  | 0.0       | 505.68       | false    | false    |
      | 22 January 2024  | Interest Refund        | 2.84   | 2.84      | 0.0      | 0.0  | 0.0       | 502.84       | false    | false    |
    When Admin sets the business date to "26 January 2024"
    And Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "26 January 2024" with 400 EUR transaction amount and system-generated Idempotency key
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 100.84 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                  | 750.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024  | 834.2           | 165.8         | 5.68     | 0.0  | 0.0       | 171.48 | 171.48 | 171.48     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 22 January 2024  | 662.72          | 171.48        | 0.0      | 0.0  | 0.0       | 171.48 | 171.48 | 171.48     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 26 January 2024  | 491.78          | 170.94        | 0.54     | 0.0  | 0.0       | 171.48 | 171.48 | 171.48     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 26 January 2024  | 320.3           | 171.48        | 0.0      | 0.0  | 0.0       | 171.48 | 171.48 | 171.48     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 26 January 2024  | 148.82          | 171.48        | 0.0      | 0.0  | 0.0       | 171.48 | 171.48 | 171.48     | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 01 February 2024 | 0.0             | 148.82        | 0.16     | 0.0  | 0.0       | 148.98 | 148.98 | 148.98     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 6.38     | 0.0  | 0.0       | 1006.38 | 1006.38 | 1006.38    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement           | 750.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Merchant Issued Refund | 500.0  | 494.32    | 5.68     | 0.0  | 0.0       | 505.68       | false    | false    |
      | 22 January 2024  | Interest Refund        | 2.84   | 2.84      | 0.0      | 0.0  | 0.0       | 502.84       | false    | false    |
      | 26 January 2024  | Payout Refund          | 400.0  | 399.46    | 0.54     | 0.0  | 0.0       | 103.38       | false    | false    |
      | 26 January 2024  | Interest Refund        | 2.7    | 2.7       | 0.0      | 0.0  | 0.0       | 100.68       | false    | false    |
      | 01 February 2024 | Repayment              | 100.84 | 100.68    | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Accrual                | 6.38   | 0.0       | 6.38     | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3307
  Scenario: UC14 - Multi disbursements, different days, multiple partial refunds within first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    And Admin successfully disburse the loan on "01 January 2024" with "250" EUR transaction amount
    When Admin sets the business date to "05 January 2024"
    And Admin successfully disburse the loan on "05 January 2024" with "500" EUR transaction amount
    When Admin sets the business date to "22 January 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 250.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      |    |      | 01 January 2024  |           | 250.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      |    |      | 05 January 2024  |           | 500.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 2  | 29   | 01 March 2024    |           | 671.62          | 164.83        | 6.56     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 3  | 31   | 01 April 2024    |           | 505.86          | 165.76        | 5.63     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 4  | 30   | 01 May 2024      |           | 338.57          | 167.29        | 4.1      | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 5  | 31   | 01 June 2024     |           | 170.02          | 168.55        | 2.84     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 170.02        | 1.38     | 0.0  | 0.0       | 171.4  | 0.0  | 0.0        | 0.0  | 171.4       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 28.35    | 0.0  | 0.0       | 1028.35 | 0.0  | 0.0        | 0.0  | 1028.35     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    And Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "22 January 2024" with 250 EUR transaction amount and system-generated Idempotency key
    When Admin sets the business date to "26 January 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 05 January 2024  |                 | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 833.75          | 166.25        | 5.14     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 670.31          | 163.44        | 7.95     | 0.0  | 0.0       | 171.39 | 80.03  | 80.03      | 0.0  | 91.36       |
      | 3  | 31   | 01 April 2024    |                 | 504.54          | 165.77        | 5.62     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 4  | 30   | 01 May 2024      |                 | 337.24          | 167.3         | 4.09     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 5  | 31   | 01 June 2024     |                 | 168.68          | 168.56        | 2.83     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 168.68        | 1.37     | 0.0  | 0.0       | 170.05 | 0.0    | 0.0        | 0.0  | 170.05      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 27.0     | 0.0  | 0.0       | 1027.0 | 251.42 | 251.42     | 0.0  | 775.58      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement     | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Payout Refund    | 250.0  | 244.86    | 5.14     | 0.0  | 0.0       | 755.14       | false    | false    |
      | 22 January 2024  | Interest Refund  | 1.42   | 1.42      | 0.0      | 0.0  | 0.0       | 753.72       | false    | false    |
    And Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "26 January 2024" with 400 EUR transaction amount and system-generated Idempotency key
    When Admin sets the business date to "01 February 2024"
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                 | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 05 January 2024  |                 | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024 | 833.75          | 166.25        | 5.14     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 26 January 2024 | 663.18          | 170.57        | 0.82     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 26 January 2024 | 491.79          | 171.39        | 0.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      |                 | 329.54          | 162.25        | 9.14     | 0.0  | 0.0       | 171.39 | 139.8  | 139.8      | 0.0  | 31.59       |
      | 5  | 31   | 01 June 2024     |                 | 160.91          | 168.63        | 2.76     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 160.91        | 1.31     | 0.0  | 0.0       | 162.22 | 0.0    | 0.0        | 0.0  | 162.22      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 19.17    | 0.0  | 0.0       | 1019.17 | 653.97 | 653.97     | 0.0  | 365.2       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Payout Refund          | 250.0  | 244.86    | 5.14     | 0.0  | 0.0       | 755.14       | false    | false    |
      | 22 January 2024  | Interest Refund        | 1.42   | 1.42      | 0.0      | 0.0  | 0.0       | 753.72       | false    | false    |
      | 26 January 2024  | Merchant Issued Refund | 400.0  | 399.18    | 0.82     | 0.0  | 0.0       | 354.54       | false    | false    |
      | 26 January 2024  | Interest Refund        | 2.55   | 2.55      | 0.0      | 0.0  | 0.0       | 351.99       | false    | false    |
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 31.59 EUR transaction amount
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 171.39 EUR transaction amount
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 153.38 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                  | 250.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 05 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 22 January 2024  | 833.75          | 166.25        | 5.14     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 26 January 2024  | 663.18          | 170.57        | 0.82     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 26 January 2024  | 491.79          | 171.39        | 0.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 February 2024 | 320.97          | 170.82        | 0.57     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 01 March 2024    | 152.1           | 168.87        | 2.52     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 01 April 2024    | 0.0             | 152.1         | 1.28     | 0.0  | 0.0       | 153.38 | 153.38 | 153.38     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 10.33    | 0.0  | 0.0       | 1010.33 | 1010.33 | 1010.33    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 250.0        | false    | false    |
      | 01 January 2024  | Disbursement           | 250.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2024  | Payout Refund          | 250.0  | 244.86    | 5.14     | 0.0  | 0.0       | 755.14       | false    | false    |
      | 22 January 2024  | Interest Refund        | 1.42   | 1.42      | 0.0      | 0.0  | 0.0       | 753.72       | false    | false    |
      | 26 January 2024  | Merchant Issued Refund | 400.0  | 399.18    | 0.82     | 0.0  | 0.0       | 354.54       | false    | false    |
      | 26 January 2024  | Interest Refund        | 2.55   | 2.55      | 0.0      | 0.0  | 0.0       | 351.99       | false    | false    |
      | 01 February 2024 | Repayment              | 31.59  | 31.02     | 0.57     | 0.0  | 0.0       | 320.97       | false    | false    |
      | 01 March 2024    | Repayment              | 171.39 | 168.87    | 2.52     | 0.0  | 0.0       | 152.1        | false    | false    |
      | 01 April 2024    | Repayment              | 153.38 | 152.1     | 1.28     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 April 2024    | Accrual                | 10.33  | 0.0       | 10.33    | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3308
  Scenario: UC15 - Multi disbursements, different days, multiple partial refunds after first installment period
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "500" EUR transaction amount
    When Admin sets the business date to "05 January 2024"
    And Admin successfully disburse the loan on "05 January 2024" with "500" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 500.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      |    |      | 01 January 2024  |           | 500.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 2  | 29   | 01 March 2024    |           | 671.62          | 164.83        | 6.56     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 3  | 31   | 01 April 2024    |           | 505.86          | 165.76        | 5.63     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 4  | 30   | 01 May 2024      |           | 338.57          | 167.29        | 4.1      | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 5  | 31   | 01 June 2024     |           | 170.02          | 168.55        | 2.84     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 170.02        | 1.38     | 0.0  | 0.0       | 171.4  | 0.0  | 0.0        | 0.0  | 171.4       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 28.35    | 0.0  | 0.0       | 1028.35 | 0.0  | 0.0        | 0.0  | 1028.35     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 171.39 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 671.62          | 164.83        | 6.56     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 3  | 31   | 01 April 2024    |                  | 505.86          | 165.76        | 5.63     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 4  | 30   | 01 May 2024      |                  | 338.57          | 167.29        | 4.1      | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 5  | 31   | 01 June 2024     |                  | 170.02          | 168.55        | 2.84     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 170.02        | 1.38     | 0.0  | 0.0       | 171.4  | 0.0    | 0.0        | 0.0  | 171.4       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 28.35    | 0.0  | 0.0       | 1028.35 | 171.39 | 0.0        | 0.0  | 856.96      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment        | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
    When Admin sets the business date to "13 February 2024"
    And Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "13 February 2024" with 250 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 13 February 2024 | 667.78          | 168.67        | 2.72     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    |                  | 504.01          | 163.77        | 7.62     | 0.0  | 0.0       | 171.39 | 81.52  | 81.52      | 0.0  | 89.87       |
      | 4  | 30   | 01 May 2024      |                  | 336.71          | 167.3         | 4.09     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 5  | 31   | 01 June 2024     |                  | 168.14          | 168.57        | 2.82     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 168.14        | 1.36     | 0.0  | 0.0       | 169.5  | 0.0    | 0.0        | 0.0  | 169.5       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid  | In advance | Late | Outstanding |
      | 1000.0        | 26.45    | 0.0  | 0.0       | 1026.45 | 424.3 | 252.91     | 0.0  | 602.15      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment        | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
      | 13 February 2024 | Payout Refund    | 250.0  | 247.28    | 2.72     | 0.0  | 0.0       | 589.17       | false    | false    |
      | 13 February 2024 | Interest Refund  | 2.91   | 2.91      | 0.0      | 0.0  | 0.0       | 586.26       | false    | false    |
    When Admin sets the business date to "24 February 2024"
    And Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "24 February 2024" with 400 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 13 February 2024 | 667.78          | 168.67        | 2.72     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 24 February 2024 | 498.13          | 169.65        | 1.74     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 24 February 2024 | 326.74          | 171.39        | 0.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     |                  | 160.19          | 166.55        | 4.84     | 0.0  | 0.0       | 171.39 | 144.44 | 144.44     | 0.0  | 26.95       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 160.19        | 1.3      | 0.0  | 0.0       | 161.49 | 0.0    | 0.0        | 0.0  | 161.49      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid  | In advance | Late | Outstanding |
      | 1000.0        | 18.44    | 0.0  | 0.0       | 1018.44 | 830.0 | 658.61     | 0.0  | 188.44      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
      | 13 February 2024 | Payout Refund          | 250.0  | 247.28    | 2.72     | 0.0  | 0.0       | 589.17       | false    | false    |
      | 13 February 2024 | Interest Refund        | 2.91   | 2.91      | 0.0      | 0.0  | 0.0       | 586.26       | false    | false    |
      | 24 February 2024 | Merchant Issued Refund | 400.0  | 398.26    | 1.74     | 0.0  | 0.0       | 188.0        | false    | false    |
      | 24 February 2024 | Interest Refund        | 5.7    | 5.7       | 0.0      | 0.0  | 0.0       | 182.3        | false    | false    |
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 26.95 EUR transaction amount
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 156.96 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 13 February 2024 | 667.78          | 168.67        | 2.72     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 24 February 2024 | 498.13          | 169.65        | 1.74     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 24 February 2024 | 326.74          | 171.39        | 0.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 01 March 2024    | 155.65          | 171.09        | 0.3      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 01 April 2024    | 0.0             | 155.65        | 1.31     | 0.0  | 0.0       | 156.96 | 156.96 | 156.96     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 13.91    | 0.0  | 0.0       | 1013.91 | 1013.91 | 842.52     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
      | 13 February 2024 | Payout Refund          | 250.0  | 247.28    | 2.72     | 0.0  | 0.0       | 589.17       | false    | false    |
      | 13 February 2024 | Interest Refund        | 2.91   | 2.91      | 0.0      | 0.0  | 0.0       | 586.26       | false    | false    |
      | 24 February 2024 | Merchant Issued Refund | 400.0  | 398.26    | 1.74     | 0.0  | 0.0       | 188.0        | false    | false    |
      | 24 February 2024 | Interest Refund        | 5.7    | 5.7       | 0.0      | 0.0  | 0.0       | 182.3        | false    | false    |
      | 01 March 2024    | Repayment              | 26.95  | 26.65     | 0.3      | 0.0  | 0.0       | 155.65       | false    | false    |
      | 01 April 2024    | Repayment              | 156.96 | 155.65    | 1.31     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 April 2024    | Accrual                | 13.91  | 0.0       | 13.91    | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3309
  Scenario: UC16 - Multi disbursements, different days, multiple partial refunds crossing multiple installment periods
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "500" EUR transaction amount
    When Admin sets the business date to "05 January 2024"
    And Admin successfully disburse the loan on "05 January 2024" with "500" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 500.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      |    |      | 05 January 2024  |           | 500.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 2  | 29   | 01 March 2024    |           | 671.62          | 164.83        | 6.56     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 3  | 31   | 01 April 2024    |           | 505.86          | 165.76        | 5.63     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 4  | 30   | 01 May 2024      |           | 338.57          | 167.29        | 4.1      | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 5  | 31   | 01 June 2024     |           | 170.02          | 168.55        | 2.84     | 0.0  | 0.0       | 171.39 | 0.0  | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 170.02        | 1.38     | 0.0  | 0.0       | 171.4  | 0.0  | 0.0        | 0.0  | 171.4       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 28.35    | 0.0  | 0.0       | 1028.35 | 0.0  | 0.0        | 0.0  | 1028.35     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 171.39 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 05 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 671.62          | 164.83        | 6.56     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 3  | 31   | 01 April 2024    |                  | 505.86          | 165.76        | 5.63     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 4  | 30   | 01 May 2024      |                  | 338.57          | 167.29        | 4.1      | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 5  | 31   | 01 June 2024     |                  | 170.02          | 168.55        | 2.84     | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 170.02        | 1.38     | 0.0  | 0.0       | 171.4  | 0.0    | 0.0        | 0.0  | 171.4       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 28.35    | 0.0  | 0.0       | 1028.35 | 171.39 | 0.0        | 0.0  | 856.96      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement     | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment        | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
    When Admin sets the business date to "13 February 2024"
    And Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "13 February 2024" with 400 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 05 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 13 February 2024 | 667.78          | 168.67        | 2.72     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 13 February 2024 | 496.39          | 171.39        | 0.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      |                  | 334.17          | 162.22        | 9.17     | 0.0  | 0.0       | 171.39 | 61.88  | 61.88      | 0.0  | 109.51      |
      | 5  | 31   | 01 June 2024     |                  | 165.58          | 168.59        | 2.8      | 0.0  | 0.0       | 171.39 | 0.0    | 0.0        | 0.0  | 171.39      |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 165.58        | 1.34     | 0.0  | 0.0       | 166.92 | 0.0    | 0.0        | 0.0  | 166.92      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 23.87    | 0.0  | 0.0       | 1023.87 | 576.05 | 404.66     | 0.0  | 447.82      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
      | 13 February 2024 | Merchant Issued Refund | 400.0  | 397.28    | 2.72     | 0.0  | 0.0       | 439.17       | false    | false    |
      | 13 February 2024 | Interest Refund        | 4.66   | 4.66      | 0.0      | 0.0  | 0.0       | 434.51       | false    | false    |
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 109.62 EUR transaction amount
    When Admin sets the business date to "01 April 2024"
    And Customer makes "AUTOPAY" repayment on "01 April 2024" with 171.39 EUR transaction amount
    When Admin sets the business date to "06 April 2024"
    And Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "06 April 2024" with 400 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 05 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 13 February 2024 | 667.78          | 168.67        | 2.72     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 13 February 2024 | 496.39          | 171.39        | 0.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 March 2024    | 327.0           | 169.39        | 2.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 01 April 2024    | 158.35          | 168.65        | 2.74     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 06 April 2024    | 0.0             | 158.35        | 0.21     | 0.0  | 0.0       | 158.56 | 158.56 | 158.56     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 15.51    | 0.0  | 0.0       | 1015.51 | 1015.51 | 844.12     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
      | 13 February 2024 | Merchant Issued Refund | 400.0  | 397.28    | 2.72     | 0.0  | 0.0       | 439.17       | false    | false    |
      | 13 February 2024 | Interest Refund        | 4.66   | 4.66      | 0.0      | 0.0  | 0.0       | 434.51       | false    | false    |
      | 01 March 2024    | Repayment              | 109.62 | 107.62    | 2.0      | 0.0  | 0.0       | 326.89       | false    | false    |
      | 01 April 2024    | Repayment              | 171.39 | 168.65    | 2.74     | 0.0  | 0.0       | 158.24       | false    | false    |
      | 06 April 2024    | Payout Refund          | 400.0  | 158.24    | 0.21     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 April 2024    | Interest Refund        | 9.15   | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 April 2024    | Accrual                | 15.51  | 0.0       | 15.51    | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "07 April 2024"
    When Admin makes Credit Balance Refund transaction on "07 April 2024" with 250.7 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      |    |      | 05 January 2024  |                  | 500.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 836.45          | 163.55        | 7.84     | 0.0  | 0.0       | 171.39 | 171.39 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 13 February 2024 | 667.78          | 168.67        | 2.72     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 13 February 2024 | 496.39          | 171.39        | 0.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 March 2024    | 327.0           | 169.39        | 2.0      | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 01 April 2024    | 158.35          | 168.65        | 2.74     | 0.0  | 0.0       | 171.39 | 171.39 | 171.39     | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 06 April 2024    | 0.0             | 158.35        | 0.21     | 0.0  | 0.0       | 158.56 | 158.56 | 158.56     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 15.51    | 0.0  | 0.0       | 1015.51 | 1015.51 | 844.12     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 500.0        | false    | false    |
      | 05 January 2024  | Disbursement           | 500.0  | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 February 2024 | Repayment              | 171.39 | 163.55    | 7.84     | 0.0  | 0.0       | 836.45       | false    | false    |
      | 13 February 2024 | Merchant Issued Refund | 400.0  | 397.28    | 2.72     | 0.0  | 0.0       | 439.17       | false    | false    |
      | 13 February 2024 | Interest Refund        | 4.66   | 4.66      | 0.0      | 0.0  | 0.0       | 434.51       | false    | false    |
      | 01 March 2024    | Repayment              | 109.62 | 107.62    | 2.0      | 0.0  | 0.0       | 326.89       | false    | false    |
      | 01 April 2024    | Repayment              | 171.39 | 168.65    | 2.74     | 0.0  | 0.0       | 158.24       | false    | false    |
      | 06 April 2024    | Payout Refund          | 400.0  | 158.24    | 0.21     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 April 2024    | Interest Refund        | 9.15   | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 April 2024    | Accrual                | 15.51  | 0.0       | 15.51    | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 April 2024    | Credit Balance Refund  | 250.7  | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3310
  Scenario: UC17 - Single disbursement, multiple partial refund within first installment period, one time payment prior to refund
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2024   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    When Admin sets the business date to "12 January 2024"
    And Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "12 January 2024" with 400 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 12 January 2024 | 831.49          | 168.51        | 2.98     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 12 January 2024 | 660.0           | 171.49        | 0.0      | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    |                 | 501.54          | 158.46        | 13.03    | 0.0  | 0.0       | 171.49 | 58.21  | 58.21      | 0.0  | 113.28      |
      | 4  | 30   | 01 May 2024      |                 | 334.12          | 167.42        | 4.07     | 0.0  | 0.0       | 171.49 | 0.0    | 0.0        | 0.0  | 171.49      |
      | 5  | 31   | 01 June 2024     |                 | 165.43          | 168.69        | 2.8      | 0.0  | 0.0       | 171.49 | 0.0    | 0.0        | 0.0  | 171.49      |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 165.43        | 1.34     | 0.0  | 0.0       | 166.77 | 0.0    | 0.0        | 0.0  | 166.77      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 24.22    | 0.0  | 0.0       | 1024.22 | 401.19 | 401.19     | 0.0  | 623.03      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 12 January 2024  | Payout Refund    | 400.0  | 397.02    | 2.98     | 0.0  | 0.0       | 602.98       | false    | false    |
      | 12 January 2024  | Interest Refund  | 1.19   | 1.19      | 0.0      | 0.0  | 0.0       | 601.79       | false    | false    |
    When Admin sets the business date to "17 January 2024"
    And Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "17 January 2024" with 150 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 12 January 2024 | 831.49          | 168.51        | 2.98     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 12 January 2024 | 660.0           | 171.49        | 0.0      | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 17 January 2024 | 489.32          | 170.68        | 0.81     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      |                 | 330.67          | 158.65        | 12.84    | 0.0  | 0.0       | 171.49 | 37.37  | 37.37      | 0.0  | 134.12      |
      | 5  | 31   | 01 June 2024     |                 | 161.95          | 168.72        | 2.77     | 0.0  | 0.0       | 171.49 | 0.0    | 0.0        | 0.0  | 171.49      |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 161.95        | 1.31     | 0.0  | 0.0       | 163.26 | 0.0    | 0.0        | 0.0  | 163.26      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 20.71    | 0.0  | 0.0       | 1020.71 | 551.84 | 551.84     | 0.0  | 468.87      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 12 January 2024  | Payout Refund          | 400.0  | 397.02    | 2.98     | 0.0  | 0.0       | 602.98       | false    | false    |
      | 12 January 2024  | Interest Refund        | 1.19   | 1.19      | 0.0      | 0.0  | 0.0       | 601.79       | false    | false    |
      | 17 January 2024  | Merchant Issued Refund | 150.0  | 149.19    | 0.81     | 0.0  | 0.0       | 452.6        | false    | false    |
      | 17 January 2024  | Interest Refund        | 0.65   | 0.65      | 0.0      | 0.0  | 0.0       | 451.95       | false    | false    |
    When Admin sets the business date to "01 February 2024"
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 134.11 EUR transaction amount
    When Admin sets the business date to "08 February 2024"
    And Customer makes "PAYOUT_REFUND" transaction with "AUTOPAY" payment type on "01 February 2024" with 250 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2024 | 12 January 2024  | 831.49          | 168.51        | 2.98     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 12 January 2024  | 660.0           | 171.49        | 0.0      | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 17 January 2024  | 489.32          | 170.68        | 0.81     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 February 2024 | 319.66          | 169.66        | 1.83     | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 01 February 2024 | 148.17          | 171.49        | 0.0      | 0.0  | 0.0       | 171.49 | 171.49 | 171.49     | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 148.17        | 2.77     | 0.0  | 0.0       | 150.94 | 80.6   | 80.6       | 0.0  | 70.34       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 8.39     | 0.0  | 0.0       | 1008.39 | 938.05 | 938.05     | 0.0  | 70.34       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 12 January 2024  | Payout Refund          | 400.0  | 397.02    | 2.98     | 0.0  | 0.0       | 602.98       | false    | false    |
      | 12 January 2024  | Interest Refund        | 1.19   | 1.19      | 0.0      | 0.0  | 0.0       | 601.79       | false    | false    |
      | 17 January 2024  | Merchant Issued Refund | 150.0  | 149.19    | 0.81     | 0.0  | 0.0       | 452.6        | false    | false    |
      | 17 January 2024  | Interest Refund        | 0.65   | 0.65      | 0.0      | 0.0  | 0.0       | 451.95       | false    | false    |
      | 01 February 2024 | Repayment              | 134.11 | 132.29    | 1.82     | 0.0  | 0.0       | 319.66       | false    | false    |
      | 01 February 2024 | Payout Refund          | 250.0  | 249.99    | 0.01     | 0.0  | 0.0       | 69.67        | false    | false    |
      | 01 February 2024 | Interest Refund        | 2.1    | 2.1       | 0.0      | 0.0  | 0.0       | 67.57        | false    | false    |
    When Admin sets the business date to "01 March 2024"
    And Customer makes "AUTOPAY" repayment on "01 March 2024" with 68.1 EUR transaction amount
    Then Loan status will be "CLOSED_OBLIGATIONS_MET"

  @TestRailId:C3288
  Scenario: Verify the recalculated EMI after interest rate change on the repayment schedule
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "15 January 2024"
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "01 February 2024"
    When Admin runs inline COB job for Loan
    And Customer makes "AUTOPAY" repayment on "01 February 2024" with 33.91 EUR transaction amount
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate  | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 02 February 2024   | 01 February 2024 |                 |                  |                 |            | 4               |
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "02 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 66.56           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 16.9  | 16.9       | 0.0  | 0.11        |
      | 3  | 31   | 01 April 2024    |                  | 50.17           | 16.39         | 0.44     | 0.0  | 0.0       | 16.83 | 0.0   | 0.0        | 0.0  | 16.83       |
      | 4  | 30   | 01 May 2024      |                  | 33.51           | 16.66         | 0.17     | 0.0  | 0.0       | 16.83 | 0.0   | 0.0        | 0.0  | 16.83       |
      | 5  | 31   | 01 June 2024     |                  | 16.79           | 16.72         | 0.11     | 0.0  | 0.0       | 16.83 | 0.0   | 0.0        | 0.0  | 16.83       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.79         | 0.06     | 0.0  | 0.0       | 16.85 | 0.0   | 0.0        | 0.0  | 16.85       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.36     | 0.0  | 0.0       | 101.36 | 33.91 | 16.9       | 0.0  | 67.45       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Repayment        | 33.91  | 33.33     | 0.58     | 0.0  | 0.0       | 66.67        | false    | false    |
      | 01 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3289
  Scenario: Verify Interest recalculation - EARLY repayment, adjust LAST installment - UC1: 360/30, early repayment with amount less then emi amount
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 15 EUR on 15 Jan ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 15 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.52           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0 | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 66.91           | 16.61         | 0.4      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.2            | 16.71         | 0.3      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.4            | 16.8          | 0.21     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.5            | 16.9          | 0.11     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.5          | 0.01     | 0.0  | 0.0       | 16.51 | 15.0 | 15.0       | 0.0  | 1.51        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.56     | 0.0  | 0.0       | 101.56 | 15   | 15         | 0.0  | 86.56       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 15.0   | 15.0      | 0.0      | 0.0  | 0.0       | 85.0         | false    | false    |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3290
  Scenario: Verify Interest recalculation - EARLY repayment, adjust LAST installment - UC2: 360/30, early repayment emi amount paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 17.01 EUR on 15 Jan ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 |                 | 83.52           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |                 | 66.9            | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.18           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.36           | 16.82         | 0.19     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 17.01           | 16.35         | 0.1      | 0.0  | 0.0       | 16.45 | 0.0   | 0.0        | 0.0  | 16.45       |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.5      | 0.0  | 0.0       | 101.5 | 17.01 | 17.01      | 0.0  | 84.49       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 17.01     | 0.0      | 0.0  | 0.0       | 82.99        | false    | false    |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3291
  Scenario: Verify Interest recalculation - EARLY repayment, adjust LAST installment - UC3: 360/30, early repayment with excess emi amount paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 34.02 EUR on 15 Jan ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 34.02 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 |                 | 83.46           | 16.54         | 0.47     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |                 | 66.74           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 49.92           | 16.82         | 0.19     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 34.02           | 15.9          | 0.09     | 0.0  | 0.0       | 15.99 | 0.0   | 0.0        | 0.0  | 15.99       |
      | 5  | 31   | 01 June 2024     | 15 January 2024 | 17.01           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.04     | 0.0  | 0.0       | 101.04 | 34.02 | 34.02      | 0.0  | 67.02       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 34.02  | 34.02     | 0.0      | 0.0  | 0.0       | 65.98        | false    | false    |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3292
  Scenario: Verify Interest recalculation - EARLY repayment, adjust LAST installment - UC4: 360/30, pre-closure after early payment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 17.01 EUR on 15 Jan ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    When Admin runs inline COB job for Loan
#    --- schedule allocation before pre-closure ---
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 |                 | 83.52           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |                 | 66.9            | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.18           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.36           | 16.82         | 0.19     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 17.01           | 16.35         | 0.1      | 0.0  | 0.0       | 16.45 | 0.0   | 0.0        | 0.0  | 16.45       |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.5      | 0.0  | 0.0       | 101.5 | 17.01 | 17.01      | 0.0  | 84.49       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 17.01     | 0.0      | 0.0  | 0.0       | 82.99        | false    | false    |
#    --- Early repayment with 83.07 EUR on 20 Jan ---
    When Admin sets the business date to "20 January 2024"
    And Customer makes "AUTOPAY" repayment on "20 January 2024" with 83.33 EUR transaction amount
    When Admin runs inline COB job for Loan
#    --- schedule allocation after pre-closure ---
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 20 January 2024 | 85.05           | 14.95         | 0.34     | 0.0  | 0.0       | 15.29 | 15.29 | 15.29      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 20 January 2024 | 68.04           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 20 January 2024 | 51.03           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 20 January 2024 | 34.02           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2024     | 20 January 2024 | 17.01           | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 100.0         | 0.34     | 0.0  | 0.0       | 100.34 | 100.34 | 100.34     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 17.01     | 0.0      | 0.0  | 0.0       | 82.99        | false    | false    |
      | 20 January 2024  | Repayment        | 83.33  | 82.99     | 0.34     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 January 2024  | Accrual          | 0.1    | 0.0       | 0.1      | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3312
  Scenario: Verify Interest recalculation - EARLY repayment, adjust LAST installment - UC5: 360/30, interest modification after early payment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- Early repayment with 17.01 EUR on 15 Jan ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 |                 | 83.52           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |                 | 66.9            | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.18           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.36           | 16.82         | 0.19     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 17.01           | 16.35         | 0.1      | 0.0  | 0.0       | 16.45 | 0.0   | 0.0        | 0.0  | 16.45       |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.5      | 0.0  | 0.0       | 101.5 | 17.01 | 17.01      | 0.0  | 84.49       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 17.01     | 0.0      | 0.0  | 0.0       | 82.99        | false    | false    |
#    --- interest change to 0.04(4%) on 20 Jan ---
    When Admin sets the business date to "20 January 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 21 January 2024    | 20 January 2024 |                 |                  |                 |            | 4               |
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 |                 | 83.65           | 16.35         | 0.45     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 2  | 29   | 01 March 2024    |                 | 67.07           | 16.58         | 0.22     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 3  | 31   | 01 April 2024    |                 | 50.44           | 16.63         | 0.17     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 4  | 30   | 01 May 2024      |                 | 33.75           | 16.69         | 0.11     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 5  | 31   | 01 June 2024     |                 | 17.01           | 16.74         | 0.06     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.01     | 0.0  | 0.0       | 101.01 | 17.01 | 17.01      | 0.0  | 84.0        |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 17.01     | 0.0      | 0.0  | 0.0       | 82.99        | false    | false    |
      | 15 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3297
  Scenario: Verify the Loan reschedule - Interest modification - UC1: Interest modification after early payment with Adjustment to NEXT installment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#   --- 1st installment paid on due date ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 67.0            | 16.25         | 0.76     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.38           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0   | 0.0        | 0.0  | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 17.01 | 17.01      | 0.0  | 84.99       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |
#   --- Loan reschedule: Interest rate modification between two installments ---
    When Admin sets the business date to "19 January 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 20 January 2024    | 19 January 2024 |                 |                  |                 |            | 4               |
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "20 January 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 66.86           | 16.39         | 0.46     | 0.0  | 0.0       | 16.85 | 0.0   | 0.0        | 0.0  | 16.85       |
      | 3  | 31   | 01 April 2024    |                 | 50.23           | 16.63         | 0.22     | 0.0  | 0.0       | 16.85 | 0.0   | 0.0        | 0.0  | 16.85       |
      | 4  | 30   | 01 May 2024      |                 | 33.55           | 16.68         | 0.17     | 0.0  | 0.0       | 16.85 | 0.0   | 0.0        | 0.0  | 16.85       |
      | 5  | 31   | 01 June 2024     |                 | 16.81           | 16.74         | 0.11     | 0.0  | 0.0       | 16.85 | 0.0   | 0.0        | 0.0  | 16.85       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.81         | 0.06     | 0.0  | 0.0       | 16.87 | 0.0   | 0.0        | 0.0  | 16.87       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.28     | 0.0  | 0.0       | 101.28 | 17.01 | 17.01      | 0.0  | 84.27       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |
      | 18 January 2024  | Accrual          | 0.31   | 0.0       | 0.31     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3298
  Scenario: Verify the Loan reschedule - Interest modification - UC2: Interest modification after early partial payment with Adjustment to NEXT installment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#   --- 1st installment paid on due date ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.0 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.24           | 16.76         | 0.25     | 0.0  | 0.0       | 17.01 | 17.0 | 17.0       | 0.0  | 0.01        |
      | 2  | 29   | 01 March 2024    |           | 67.0            | 16.24         | 0.77     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.38           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0  | 0.0        | 0.0  | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 17.0 | 17.0       | 0.0  | 85.0        |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.0   | 16.75     | 0.25     | 0.0  | 0.0       | 83.25        | false    | false    |
#   --- Loan reschedule: Interest rate modification between two installments ---
    When Admin sets the business date to "19 January 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 20 January 2024    | 19 January 2024 |                 |                  |                 |            | 4               |
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "20 January 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.24           | 16.76         | 0.25     | 0.0  | 0.0       | 17.01 | 17.0 | 17.0       | 0.0  | 0.01        |
      | 2  | 29   | 01 March 2024    |           | 66.86           | 16.38         | 0.47     | 0.0  | 0.0       | 16.85 | 0.0  | 0.0        | 0.0  | 16.85       |
      | 3  | 31   | 01 April 2024    |           | 50.23           | 16.63         | 0.22     | 0.0  | 0.0       | 16.85 | 0.0  | 0.0        | 0.0  | 16.85       |
      | 4  | 30   | 01 May 2024      |           | 33.55           | 16.68         | 0.17     | 0.0  | 0.0       | 16.85 | 0.0  | 0.0        | 0.0  | 16.85       |
      | 5  | 31   | 01 June 2024     |           | 16.81           | 16.74         | 0.11     | 0.0  | 0.0       | 16.85 | 0.0  | 0.0        | 0.0  | 16.85       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.81         | 0.06     | 0.0  | 0.0       | 16.87 | 0.0  | 0.0        | 0.0  | 16.87       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.28     | 0.0  | 0.0       | 101.28 | 17.0 | 17.0       | 0.0  | 84.28       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.0   | 16.75     | 0.25     | 0.0  | 0.0       | 83.25        | false    | false    |
      | 18 January 2024  | Accrual          | 0.31   | 0.0       | 0.31     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3311
  Scenario: Verify the Loan reschedule - Interest modification - UC2: Interest modification after early partial payment with Adjustment to LAST installment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#    --- 1st installment paid on due date ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 |                 | 83.52           | 16.48         | 0.53     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |                 | 66.9            | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.18           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.36           | 16.82         | 0.19     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 17.01           | 16.35         | 0.1      | 0.0  | 0.0       | 16.45 | 0.0   | 0.0        | 0.0  | 16.45       |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.5      | 0.0  | 0.0       | 101.5 | 17.01 | 17.01      | 0.0  | 84.49       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 17.01     | 0.0      | 0.0  | 0.0       | 82.99        | false    | false    |
#   --- Loan reschedule: Interest rate modification between two installments ---
    When Admin sets the business date to "19 January 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 20 January 2024    | 19 January 2024 |                 |                  |                 |            | 4               |
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "20 January 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 |                 | 83.64           | 16.36         | 0.44     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 2  | 29   | 01 March 2024    |                 | 67.06           | 16.58         | 0.22     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 3  | 31   | 01 April 2024    |                 | 50.43           | 16.63         | 0.17     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 4  | 30   | 01 May 2024      |                 | 33.74           | 16.69         | 0.11     | 0.0  | 0.0       | 16.8  | 0.0   | 0.0        | 0.0  | 16.8        |
      | 5  | 31   | 01 June 2024     |                 | 17.01           | 16.73         | 0.06     | 0.0  | 0.0       | 16.79 | 0.0   | 0.0        | 0.0  | 16.79       |
      | 6  | 30   | 01 July 2024     | 15 January 2024 | 0.0             | 17.01         | 0.0      | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.0      | 0.0  | 0.0       | 101.0 | 17.01 | 17.01      | 0.0  | 83.99       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 17.01     | 0.0      | 0.0  | 0.0       | 82.99        | false    | false    |
      | 18 January 2024  | Accrual          | 0.31   | 0.0       | 0.31     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3299
  Scenario: Verify the Loan reschedule - Interest modification - UC2: Interest modification after first installment with Adjustment to NEXT installment
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
#   --- 1st installment paid on due date ---
    When Admin sets the business date to "15 January 2024"
    And Customer makes "AUTOPAY" repayment on "15 January 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 67.0            | 16.25         | 0.76     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |                 | 50.38           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |                 | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |                 | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0   | 0.0        | 0.0  | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 17.01 | 17.01      | 0.0  | 84.99       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |
#   --- Loan reschedule: Interest rate modification on Feb 15 ---
    When Admin sets the business date to "15 February 2024"
    When Admin creates and approves Loan reschedule with the following data:
      | rescheduleFromDate | submittedOnDate  | adjustedDueDate | graceOnPrincipal | graceOnInterest | extraTerms | newInterestRate |
      | 16 February 2024   | 15 February 2024 |                 |                  |                 |            | 4               |
    When Admin runs inline COB job for Loan
    When Admin sets the business date to "16 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 15 January 2024 | 83.25           | 16.75         | 0.26     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    |                 | 67.0            | 16.25         | 0.64     | 0.0  | 0.0       | 16.89 | 0.0   | 0.0        | 0.0  | 16.89       |
      | 3  | 31   | 01 April 2024    |                 | 50.33           | 16.67         | 0.22     | 0.0  | 0.0       | 16.89 | 0.0   | 0.0        | 0.0  | 16.89       |
      | 4  | 30   | 01 May 2024      |                 | 33.61           | 16.72         | 0.17     | 0.0  | 0.0       | 16.89 | 0.0   | 0.0        | 0.0  | 16.89       |
      | 5  | 31   | 01 June 2024     |                 | 16.83           | 16.78         | 0.11     | 0.0  | 0.0       | 16.89 | 0.0   | 0.0        | 0.0  | 16.89       |
      | 6  | 30   | 01 July 2024     |                 | 0.0             | 16.83         | 0.06     | 0.0  | 0.0       | 16.89 | 0.0   | 0.0        | 0.0  | 16.89       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 100.0         | 1.46     | 0.0  | 0.0       | 101.46 | 17.01 | 17.01      | 0.0  | 84.45       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 15 January 2024  | Repayment        | 17.01  | 16.75     | 0.26     | 0.0  | 0.0       | 83.25        | false    | false    |
      | 14 February 2024 | Accrual          | 0.75   | 0.0       | 0.75     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3301
  Scenario: UC18-1 - In case of backdated repayment the Interest Refund transaction needs to be recalculated
    # using 2021 for the test since as per UC - non-leap year with 365 days should be used
    When Admin sets the business date to "01 January 2021"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2021   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 1                 | MONTHS                | 1              | MONTHS                 | 1                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2021" with "1000" amount and expected disbursement date on "01 January 2021"
    When Admin successfully disburse the loan on "01 January 2021" with "1000" EUR transaction amount
    When Admin sets the business date to "22 January 2021"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "22 January 2021" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2021  |                 | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2021 | 22 January 2021 | 0.0             | 1000.0        | 5.7      | 0.0  | 0.0       | 1005.7 | 1005.7 | 1005.7     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 5.7      | 0.0  | 0.0       | 1005.7 | 1005.7 | 1005.7     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2021  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2021  | Merchant Issued Refund | 1000.0 | 1000.0    | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2021  | Interest Refund        | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2021  | Accrual                | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | false    | false    |
    And Customer makes "AUTOPAY" repayment on "10 January 2021" with 85.63 EUR transaction amount
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      |    |      | 01 January 2021  |                 | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0     |            |      |             |
      | 1  | 31   | 01 February 2021 | 22 January 2021 | 0.0             | 1000.0        | 5.42     | 0.0  | 0.0       | 1005.42 | 1005.42 | 1005.42    | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 5.42     | 0.0  | 0.0       | 1005.42 | 1005.42 | 1005.42    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2021  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 10 January 2021  | Repayment              | 85.63  | 85.63     | 0.0      | 0.0  | 0.0       | 914.37       | false    | false    |
      | 22 January 2021  | Accrual                | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2021  | Merchant Issued Refund | 1000.0 | 914.37    | 5.42     | 0.0  | 0.0       | 0.0          | false    | true     |
      | 22 January 2021  | Interest Refund        | 5.42   | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | true     |
      | 22 January 2021  | Accrual Adjustment     | 0.28   | 0.0       | 0.28     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3302
  Scenario: UC18-2 - In case of repayment reversal the Interest Refund transaction needs to be recalculated
    # using 2021 for the test since as per UC - non-leap year with 365 days should be used
    When Admin sets the business date to "01 January 2021"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2021   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 1                 | MONTHS                | 1              | MONTHS                 | 1                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2021" with "1000" amount and expected disbursement date on "01 January 2021"
    When Admin successfully disburse the loan on "01 January 2021" with "1000" EUR transaction amount
    When Admin sets the business date to "10 January 2021"
    And Customer makes "AUTOPAY" repayment on "10 January 2021" with 85.63 EUR transaction amount
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2021  |           | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2021 |           | 0.0             | 1000.0        | 7.9      | 0.0  | 0.0       | 1007.9 | 85.63 | 85.63      | 0.0  | 922.27      |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 1000.0        | 7.9      | 0.0  | 0.0       | 1007.9 | 85.63 | 85.63      | 0.0  | 922.27      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2021  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 10 January 2021  | Repayment        | 85.63  | 85.63     | 0.0      | 0.0  | 0.0       | 914.37       | false    | false    |
    When Admin sets the business date to "22 January 2021"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "22 January 2021" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      |    |      | 01 January 2021  |                 | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0     |            |      |             |
      | 1  | 31   | 01 February 2021 | 22 January 2021 | 0.0             | 1000.0        | 5.42     | 0.0  | 0.0       | 1005.42 | 1005.42 | 1005.42    | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid    | In advance | Late | Outstanding |
      | 1000.0        | 5.42     | 0.0  | 0.0       | 1005.42 | 1005.42 | 1005.42    | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2021  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 10 January 2021  | Repayment              | 85.63  | 85.63     | 0.0      | 0.0  | 0.0       | 914.37       | false    | false    |
      | 22 January 2021  | Merchant Issued Refund | 1000.0 | 914.37    | 5.42     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2021  | Interest Refund        | 5.42   | 0.0       | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2021  | Accrual                | 5.42   | 0.0       | 5.42     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "23 January 2021"
    And Admin makes Credit Balance Refund transaction on "23 January 2021" with 85.63 EUR transaction amount
    When Customer undo "1"th "Repayment" transaction made on "10 January 2021"
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2021  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2021 |           | 0.0             | 1085.63       | 5.7      | 0.0  | 0.0       | 1091.33 | 1005.7 | 1005.7     | 0.0  | 85.63       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid   | In advance | Late | Outstanding |
      | 1085.63       | 5.7      | 0.0  | 0.0       | 1091.33 | 1005.7 | 1005.7     | 0.0  | 85.63       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2021  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 10 January 2021  | Repayment              | 85.63  | 85.63     | 0.0      | 0.0  | 0.0       | 914.37       | true     | false    |
      | 22 January 2021  | Merchant Issued Refund | 1000.0 | 1000.0    | 0.0      | 0.0  | 0.0       | 0.0          | false    | true     |
      | 22 January 2021  | Interest Refund        | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | false    | true     |
      | 23 January 2021  | Credit Balance Refund  | 85.63  | 85.63     | 0.0      | 0.0  | 0.0       | 85.63        | false    | true     |
      | 22 January 2021  | Accrual                | 5.42   | 0.0       | 5.42     | 0.0  | 0.0       | 0.0          | false    | false    |
    And In Loan Transactions the "2"th Transaction has Transaction type="Repayment" and is reverted

  @TestRailId:C3303
  Scenario: UC18-3 - In case of refund reversal the Interest Refund transaction needs to be recalculated
 # using 2021 for the test since as per UC - non-leap year with 365 days should be used
    When Admin sets the business date to "01 January 2021"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                         | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_REFUND_FULL | 01 January 2021   | 1000           | 9.9                    | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 1                 | MONTHS                | 1              | MONTHS                 | 1                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2021" with "1000" amount and expected disbursement date on "01 January 2021"
    When Admin successfully disburse the loan on "01 January 2021" with "1000" EUR transaction amount
    When Admin sets the business date to "22 January 2021"
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "22 January 2021" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 01 January 2021  |                 | 1000.0          |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 01 February 2021 | 22 January 2021 | 0.0             | 1000.0        | 5.7      | 0.0  | 0.0       | 1005.7 | 1005.7 | 1005.7     | 0.0  | 0.0         |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 5.7      | 0.0  | 0.0       | 1005.7 | 1005.7 | 1005.7     | 0.0  | 0.0         |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2021  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2021  | Merchant Issued Refund | 1000.0 | 1000.0    | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2021  | Interest Refund        | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2021  | Accrual                | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | false    | false    |
    When Customer undo "1"th "Merchant Issued Refund" transaction made on "22 January 2021"
    When Admin sets the business date to "23 January 2021"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2021  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2021 |           | 0.0             | 1000.0        | 8.41     | 0.0  | 0.0       | 1008.41 | 0.0  | 0.0        | 0.0  | 1008.41     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 8.41     | 0.0  | 0.0       | 1008.41 | 0.0  | 0.0        | 0.0  | 1008.41     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2021  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 22 January 2021  | Merchant Issued Refund | 1000.0 | 1000.0    | 0.0      | 0.0  | 0.0       | 0.0          | true     | false    |
      | 22 January 2021  | Interest Refund        | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | true     | false    |
      | 22 January 2021  | Accrual                | 5.7    | 0.0       | 5.7      | 0.0  | 0.0       | 0.0          | false    | false    |
    Then In Loan Transactions the "2"th Transaction has Transaction type="Merchant Issued Refund" and is reverted
    Then In Loan Transactions the "3"th Transaction has Transaction type="Interest Refund" and is reverted

  @TestRailId:C3313
  Scenario: Verify that due date charges after maturity date is recognized on repayment schedule
    When Admin sets the business date to "01 January 2024"
    And Admin creates a client with random data
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 75.21           | 24.79         | 0.58     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 2  | 29   | 01 March 2024    |           | 50.28           | 24.93         | 0.44     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 3  | 31   | 01 April 2024    |           | 25.2            | 25.08         | 0.29     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 25.2          | 0.15     | 0.0  | 0.0       | 25.35 | 0.0  | 0.0        | 0.0  | 25.35       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.46     | 0.0  | 0.0       | 101.46 | 0.0  | 0.0        | 0.0  | 101.46      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    When Admin sets the business date to "20 April 2024"
    And Admin runs inline COB job for Loan
    When Admin sets the business date to "15 May 2024"
    And Admin runs inline COB job for Loan
    And Admin adds "LOAN_NSF_FEE" due date charge with "15 May 2024" due date and 10 EUR transaction amount
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 75.21           | 24.79         | 0.58     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 2  | 29   | 01 March 2024    |           | 50.42           | 24.79         | 0.58     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 3  | 31   | 01 April 2024    |           | 25.63           | 24.79         | 0.58     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 25.63         | 0.58     | 0.0  | 0.0       | 26.21 | 0.0  | 0.0        | 0.0  | 26.21       |
      | 5  | 14   | 15 May 2024      |           | 0.0             | 0.0           | 0.0      | 0.0  | 10.0      | 10.0  | 0.0  | 0.0        | 0.0  | 10.0        |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.32     | 0.0  | 10.0      | 112.32 | 0.0  | 0.0        | 0.0  | 112.32      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 19 April 2024    | Accrual          | 1.66   | 0.0       | 1.66     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 April 2024    | Accrual          | 0.45   | 0.0       | 0.45     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 April 2024    | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 April 2024    | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 May 2024      | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
    And Loan Charges tab has the following data:
      | Name    | isPenalty | Payment due at     | Due as of   | Calculation type | Due  | Paid | Waived | Outstanding |
      | NSF fee | true      | Specified due date | 15 May 2024 | Flat             | 10.0 | 0.0  | 0.0    | 10.0        |

  @TestRailId:C3333
  Scenario: Verify that due date charges after maturity date with inline COB run is recognized on repayment schedule
    When Admin sets the business date to "01 January 2024"
    And Admin creates a client with random data
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 1                 | MONTHS                | 1              | MONTHS                 | 1                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 100.0         | 0.58     | 0.0  | 0.0       | 100.58 | 0.0  | 0.0        | 0.0  | 100.58      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.58     | 0.0  | 0.0       | 100.58 | 0.0  | 0.0        | 0.0  | 100.58      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    When Admin sets the business date to "15 February 2024"
    And Admin adds "LOAN_NSF_FEE" due date charge with "15 February 2024" due date and 10 EUR transaction amount
    When Admin sets the business date to "16 February 2024"
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 2 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 100.0         | 0.58     | 0.0  | 0.0       | 100.58 | 0.0  | 0.0        | 0.0  | 100.58      |
      | 2  | 14   | 15 February 2024 |           | 0.0             | 0.0           | 0.0      | 0.0  | 10.0      | 10.0   | 0.0  | 0.0        | 0.0  | 10.0        |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 0.58     | 0.0  | 10.0      | 110.58 | 0.0  | 0.0        | 0.0  | 110.58      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 02 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 January 2024  | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 January 2024  | Accrual          | 0.01   | 0.0       | 0.01     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 February 2024 | Accrual          | 0.02   | 0.0       | 0.02     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Accrual          | 10.0   | 0.0       | 0.0      | 0.0  | 10.0      | 0.0          | false    | false    |
    And Loan Charges tab has the following data:
      | Name    | isPenalty | Payment due at     | Due as of        | Calculation type | Due  | Paid | Waived | Outstanding |
      | NSF fee | true      | Specified due date | 15 February 2024 | Flat             | 10.0 | 0.0  | 0.0    | 10.0        |

  @TestRailId:C3314
  Scenario: Verify that interest refund transaction won't be created and displayed when Merchant issued refund happens on disbursement date
    When Admin sets the business date to "01 January 2024"
    And Admin creates a client with random data
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "MERCHANT_ISSUED_REFUND" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    And Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 75.21           | 24.79         | 0.58     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 2  | 29   | 01 March 2024    |           | 50.28           | 24.93         | 0.44     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 3  | 31   | 01 April 2024    |           | 25.2            | 25.08         | 0.29     | 0.0  | 0.0       | 25.37 | 0.0  | 0.0        | 0.0  | 25.37       |
      | 4  | 30   | 01 May 2024      |           | 0.0             | 25.2          | 0.15     | 0.0  | 0.0       | 25.35 | 0.0  | 0.0        | 0.0  | 25.35       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 1.46     | 0.0  | 0.0       | 101.46 | 0.0  | 0.0        | 0.0  | 101.46      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    When Admin makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "01 January 2024" with 100 EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2024 | 01 January 2024 | 74.63           | 25.37         | 0.0      | 0.0  | 0.0       | 25.37 | 25.37 | 25.37      | 0.0  | 0.0         |
      | 2  | 29   | 01 March 2024    | 01 January 2024 | 49.26           | 25.37         | 0.0      | 0.0  | 0.0       | 25.37 | 25.37 | 25.37      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2024    | 01 January 2024 | 23.89           | 25.37         | 0.0      | 0.0  | 0.0       | 25.37 | 25.37 | 25.37      | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2024      | 01 January 2024 | 0.0             | 23.89         | 0.0      | 0.0  | 0.0       | 23.89 | 23.89 | 23.89      | 0.0  | 0.0         |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.0      | 0.0  | 0.0       | 100.0 | 100.0 | 100.0      | 0.0  | 0.0         |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement           | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 January 2024  | Merchant Issued Refund | 100.0  | 100.0     | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE" loan product "MERCHANT_ISSUED_REFUND" transaction type to "REAMORTIZATION" future installment allocation rule

  @TestRailId:C3322
  Scenario: Verify accrual activity with amend rate factor after calculated interest for period was rounded - UC1: Preclose, with full disbursement at first day, accrual activity after month
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                        | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE | 01 January 2024   | 1000           | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 1                 | MONTHS                | 1              | MONTHS                 | 1                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "1000" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       |
    When Admin sets the business date to "02 January 2024"
    When Admin runs inline COB job for Loan
#    --- Accrual activity ---
    When Admin sets the business date to "02 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       |
      | 02 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 03 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 04 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 05 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 06 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 07 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 08 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 09 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 10 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 11 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 12 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 13 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 14 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 15 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 16 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 17 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 18 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 19 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 20 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 21 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 22 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 23 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 24 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 25 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 26 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 27 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 28 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 29 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 30 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 31 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 01 February 2024 | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |

  @TestRailId:C3323
  Scenario: Verify accrual activity with amend rate factor after calculated interest for period was rounded - UC2: Preclose, with multi disbursements, accrual activity after month
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                           | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 2000           | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 1                 | MONTHS                | 1              | MONTHS                 | 1                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "2000" amount and expected disbursement date on "01 January 2024"
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 2000.0          |               |          | 0.0  |           | 0.0     |      |            |      | 0.0         |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 2000.0        | 11.67    | 0.0  | 0.0       | 2011.67 | 0.0  | 0.0        | 0.0  | 2011.67     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 2000.0        | 11.67    | 0.0  | 0.0       | 2011.67 | 0.0  | 0.0        | 0.0  | 2011.67     |
    When Admin successfully disburse the loan on "01 January 2024" with "1000" EUR transaction amount
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       |
    When Admin sets the business date to "02 January 2024"
    When Admin runs inline COB job for Loan
#    --- Accrual activity after first disbursement ---
    When Admin sets the business date to "15 January 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 5.83     | 0.0  | 0.0       | 1005.83 | 0.0  | 0.0        | 0.0  | 1005.83     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       |
      | 02 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 03 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 04 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 05 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 06 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 07 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 08 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 09 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 10 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 11 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 12 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 13 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 14 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
#    --- Accrual activity after second disbursement ---
    When Admin successfully disburse the loan on "15 January 2024" with "1000" EUR transaction amount
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      |    |      | 15 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 2000.0        | 9.03     | 0.0  | 0.0       | 2009.03 | 0.0  | 0.0        | 0.0  | 2009.03     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 2000.0        | 9.03     | 0.0  | 0.0       | 2009.03 | 0.0  | 0.0        | 0.0  | 2009.03     |
    When Admin sets the business date to "02 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      |    |      | 15 January 2024  |           | 1000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 0.0             | 2000.0        | 9.03     | 0.0  | 0.0       | 2009.03 | 0.0  | 0.0        | 0.0  | 2009.03     |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 2000.0        | 9.03     | 0.0  | 0.0       | 2009.03 | 0.0  | 0.0        | 0.0  | 2009.03     |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance |
      | 01 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       |
      | 02 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 03 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 04 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 05 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 06 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 07 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 08 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 09 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 10 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 11 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 12 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 13 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 14 January 2024  | Accrual          | 0.19   | 0.0       | 0.19     | 0.0  | 0.0       | 0.0          |
      | 15 January 2024  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 2000.0       |
      | 15 January 2024  | Accrual          | 0.18   | 0.0       | 0.18     | 0.0  | 0.0       | 0.0          |
      | 16 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 17 January 2024  | Accrual          | 0.37   | 0.0       | 0.37     | 0.0  | 0.0       | 0.0          |
      | 18 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 19 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 20 January 2024  | Accrual          | 0.37   | 0.0       | 0.37     | 0.0  | 0.0       | 0.0          |
      | 21 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 22 January 2024  | Accrual          | 0.37   | 0.0       | 0.37     | 0.0  | 0.0       | 0.0          |
      | 23 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 24 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 25 January 2024  | Accrual          | 0.37   | 0.0       | 0.37     | 0.0  | 0.0       | 0.0          |
      | 26 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 27 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 28 January 2024  | Accrual          | 0.37   | 0.0       | 0.37     | 0.0  | 0.0       | 0.0          |
      | 29 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 30 January 2024  | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |
      | 31 January 2024  | Accrual          | 0.37   | 0.0       | 0.37     | 0.0  | 0.0       | 0.0          |
      | 01 February 2024 | Accrual          | 0.38   | 0.0       | 0.38     | 0.0  | 0.0       | 0.0          |

  @TestRailId:C3327
  Scenario: Verify accruals isn't reversed and replayed in COB for loan with disabled auto repayment for down payment
    When Admin sets the business date to "01 January 2024"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                     | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_RECALCULATION_DAILY_EMI_360_30_MULTIDISBURSE_DOWNPAYMENT | 01 January 2024   | 800            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "800" amount and expected disbursement date on "01 January 2024"
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 800.0           |               |          | 0.0  |           | 0.0    |      |            |      | 0.0         |
      | 1  | 0    | 01 January 2024  |           | 600.0           | 200.0         | 0.0      | 0.0  | 0.0       | 200.0  | 0.0  | 0.0        | 0.0  | 200.0       |
      | 2  | 31   | 01 February 2024 |           | 451.31          | 148.69        | 3.5      | 0.0  | 0.0       | 152.19 | 0.0  | 0.0        | 0.0  | 152.19      |
      | 3  | 29   | 01 March 2024    |           | 301.75          | 149.56        | 2.63     | 0.0  | 0.0       | 152.19 | 0.0  | 0.0        | 0.0  | 152.19      |
      | 4  | 31   | 01 April 2024    |           | 151.32          | 150.43        | 1.76     | 0.0  | 0.0       | 152.19 | 0.0  | 0.0        | 0.0  | 152.19      |
      | 5  | 30   | 01 May 2024      |           | 0.0             | 151.32        | 0.88     | 0.0  | 0.0       | 152.2  | 0.0  | 0.0        | 0.0  | 152.2       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 800.0         | 8.77     | 0.0  | 0.0       | 808.77 | 0.0  | 0.0        | 0.0  | 808.77      |
    When Admin sets the business date to "05 January 2024"
    And Admin successfully disburse the loan on "03 January 2024" with "800" EUR transaction amount
    And Customer makes "AUTOPAY" repayment on "03 January 2024" with 200 EUR transaction amount
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      |    |      | 03 January 2024  |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0   |            |      |             |
      | 1  | 0    | 03 January 2024  | 03 January 2024 | 600.0           | 200.0         | 0.0      | 0.0  | 0.0       | 200.0  | 200.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 03 February 2024 |                 | 451.31          | 148.69        | 3.5      | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 3  | 29   | 03 March 2024    |                 | 301.75          | 149.56        | 2.63     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 4  | 31   | 03 April 2024    |                 | 151.32          | 150.43        | 1.76     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 5  | 30   | 03 May 2024      |                 | 0.0             | 151.32        | 0.88     | 0.0  | 0.0       | 152.2  | 0.0   | 0.0        | 0.0  | 152.2       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 800.0         | 8.77     | 0.0  | 0.0       | 808.77 | 200.0 | 0.0        | 0.0  | 608.77      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 03 January 2024  | Repayment        | 200.0  | 200.0     | 0.0      | 0.0  | 0.0       | 600.0        | false    | false    |
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      |    |      | 03 January 2024  |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0   |            |      |             |
      | 1  | 0    | 03 January 2024  | 03 January 2024 | 600.0           | 200.0         | 0.0      | 0.0  | 0.0       | 200.0  | 200.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 03 February 2024 |                 | 451.31          | 148.69        | 3.5      | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 3  | 29   | 03 March 2024    |                 | 301.75          | 149.56        | 2.63     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 4  | 31   | 03 April 2024    |                 | 151.32          | 150.43        | 1.76     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 5  | 30   | 03 May 2024      |                 | 0.0             | 151.32        | 0.88     | 0.0  | 0.0       | 152.2  | 0.0   | 0.0        | 0.0  | 152.2       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 800.0         | 8.77     | 0.0  | 0.0       | 808.77 | 200.0 | 0.0        | 0.0  | 608.77      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 03 January 2024  | Repayment        | 200.0  | 200.0     | 0.0      | 0.0  | 0.0       | 600.0        | false    | false    |
      | 04 January 2024  | Accrual          | 0.11   | 0.0       | 0.11     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3328
  Scenario: Verify accruals isn't reversed and replayed in COB for loan with enabled auto repayment for down payment
    When Admin sets the business date to "01 January 2024"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                          | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_RECALCULATION_DAILY_EMI_360_30_MULTIDISBURSE_AUTO_DOWNPAYMENT | 01 January 2024   | 800            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "800" amount and expected disbursement date on "01 January 2024"
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 800.0           |               |          | 0.0  |           | 0.0    |      |            |      | 0.0         |
      | 1  | 0    | 01 January 2024  |           | 600.0           | 200.0         | 0.0      | 0.0  | 0.0       | 200.0  | 0.0  | 0.0        | 0.0  | 200.0       |
      | 2  | 31   | 01 February 2024 |           | 451.31          | 148.69        | 3.5      | 0.0  | 0.0       | 152.19 | 0.0  | 0.0        | 0.0  | 152.19      |
      | 3  | 29   | 01 March 2024    |           | 301.75          | 149.56        | 2.63     | 0.0  | 0.0       | 152.19 | 0.0  | 0.0        | 0.0  | 152.19      |
      | 4  | 31   | 01 April 2024    |           | 151.32          | 150.43        | 1.76     | 0.0  | 0.0       | 152.19 | 0.0  | 0.0        | 0.0  | 152.19      |
      | 5  | 30   | 01 May 2024      |           | 0.0             | 151.32        | 0.88     | 0.0  | 0.0       | 152.2  | 0.0  | 0.0        | 0.0  | 152.2       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 800.0         | 8.77     | 0.0  | 0.0       | 808.77 | 0.0  | 0.0        | 0.0  | 808.77      |
    When Admin sets the business date to "05 January 2024"
    And Admin successfully disburse the loan on "03 January 2024" with "800" EUR transaction amount
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      |    |      | 03 January 2024  |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0   |            |      |             |
      | 1  | 0    | 03 January 2024  | 03 January 2024 | 600.0           | 200.0         | 0.0      | 0.0  | 0.0       | 200.0  | 200.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 03 February 2024 |                 | 451.31          | 148.69        | 3.5      | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 3  | 29   | 03 March 2024    |                 | 301.75          | 149.56        | 2.63     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 4  | 31   | 03 April 2024    |                 | 151.32          | 150.43        | 1.76     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 5  | 30   | 03 May 2024      |                 | 0.0             | 151.32        | 0.88     | 0.0  | 0.0       | 152.2  | 0.0   | 0.0        | 0.0  | 152.2       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 800.0         | 8.77     | 0.0  | 0.0       | 808.77 | 200.0 | 0.0        | 0.0  | 608.77      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 03 January 2024  | Down Payment     | 200.0  | 200.0     | 0.0      | 0.0  | 0.0       | 600.0        | false    | false    |
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      |    |      | 03 January 2024  |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0   |            |      |             |
      | 1  | 0    | 03 January 2024  | 03 January 2024 | 600.0           | 200.0         | 0.0      | 0.0  | 0.0       | 200.0  | 200.0 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 03 February 2024 |                 | 451.31          | 148.69        | 3.5      | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 3  | 29   | 03 March 2024    |                 | 301.75          | 149.56        | 2.63     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 4  | 31   | 03 April 2024    |                 | 151.32          | 150.43        | 1.76     | 0.0  | 0.0       | 152.19 | 0.0   | 0.0        | 0.0  | 152.19      |
      | 5  | 30   | 03 May 2024      |                 | 0.0             | 151.32        | 0.88     | 0.0  | 0.0       | 152.2  | 0.0   | 0.0        | 0.0  | 152.2       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late | Outstanding |
      | 800.0         | 8.77     | 0.0  | 0.0       | 808.77 | 200.0 | 0.0        | 0.0  | 608.77      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 03 January 2024  | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 03 January 2024  | Down Payment     | 200.0  | 200.0     | 0.0      | 0.0  | 0.0       | 600.0        | false    | false    |
      | 04 January 2024  | Accrual          | 0.11   | 0.0       | 0.11     | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3329
  Scenario: Verify interest rate should not be calculated on past due principle amount for progressive loans - case when lesser than EMI amount was paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                     | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALC_DAILY_NO_CALC_ON_PAST_DUE_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    #    --- 1st installment overdue ---
    When Admin sets the business date to "02 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Accrual          | 0.58   | 0.0       | 0.58     | 0.0  | 0.0       | 0.0          | false    | false    |
    #    --- late payment comes in lesser than EMI amount ---
    When Admin sets the business date to "15 February 2024"
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 15.0 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 15.0 | 0.0        | 15.0 | 2.01        |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 15.0 | 0.0        | 15.0 | 87.05       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Accrual          | 0.58   | 0.0       | 0.58     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Repayment        | 15.0   | 15.0      | 0.0      | 0.0  | 0.0       | 85.0         | false    | false    |

  @TestRailId:C3330
  Scenario: Verify interest rate should not be calculated on past due principle amount for progressive loans - case when full EMI amount was paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                     | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALC_DAILY_NO_CALC_ON_PAST_DUE_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    #    --- 1st installment overdue ---
    When Admin sets the business date to "02 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Accrual          | 0.58   | 0.0       | 0.58     | 0.0  | 0.0       | 0.0          | false    | false    |
    #    --- late payment comes with correct EMI amount ---
    When Admin sets the business date to "15 February 2024"
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 17.01 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    |                  | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 3  | 31   | 01 April 2024    |                  | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0   | 0.0        | 0.0   | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late  | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 17.01 | 0.0        | 17.01 | 85.04       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Accrual          | 0.58   | 0.0       | 0.58     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Repayment        | 17.01  | 16.43     | 0.58     | 0.0  | 0.0       | 83.57        | false    | false    |

  @TestRailId:C3331
  Scenario: Verify interest rate should not be calculated on past due principle amount for progressive loans - case when excess EMI amount was paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                     | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALC_DAILY_NO_CALC_ON_PAST_DUE_TILL_PRECLOSE | 01 January 2024   | 100            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "100" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    #    --- 1st installment overdue ---
    When Admin sets the business date to "02 February 2024"
    When Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Accrual          | 0.58   | 0.0       | 0.58     | 0.0  | 0.0       | 0.0          | false    | false    |
    #    --- late payment comes in with excess EMI amount ---
    When Admin sets the business date to "15 February 2024"
    And Customer makes "AUTOPAY" repayment on "15 February 2024" with 34.02 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date        | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |                  | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 February 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      | 2  | 29   | 01 March 2024    | 15 February 2024 | 66.8            | 16.77         | 0.24     | 0.0  | 0.0       | 17.01 | 17.01 | 17.01      | 0.0   | 0.0         |
      | 3  | 31   | 01 April 2024    |                  | 50.38           | 16.42         | 0.59     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 4  | 30   | 01 May 2024      |                  | 33.66           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 5  | 31   | 01 June 2024     |                  | 16.85           | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0   | 0.0        | 0.0   | 17.01       |
      | 6  | 30   | 01 July 2024     |                  | 0.0             | 16.85         | 0.1      | 0.0  | 0.0       | 16.95 | 0.0   | 0.0        | 0.0   | 16.95       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      | 100.0         | 2.0      | 0.0  | 0.0       | 102.0 | 34.02 | 17.01      | 17.01 | 67.98       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 01 February 2024 | Accrual          | 0.58   | 0.0       | 0.58     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 February 2024 | Repayment        | 34.02  | 33.2      | 0.82     | 0.0  | 0.0       | 66.8         | false    | false    |

  @TestRailId:C3332
  Scenario: Verify interest rate should not be calculated on past due principle amount for progressive loans - case when multiple disbursal occurred with full EMI amount was paid
    When Admin sets the business date to "01 January 2024"
    When Admin creates a client with random data
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                     | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PAYMENT_ALLOC_INTEREST_RECALCULATION_DAILY_NO_CALC_ON_PAST_DUE_EMI_360_30_MULTIDISBURSE | 01 January 2024   | 200            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2024" with "200" amount and expected disbursement date on "01 January 2024"
    When Admin successfully disburse the loan on "01 January 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 2  | 29   | 01 March 2024    |           | 67.05           | 16.52         | 0.49     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 3  | 31   | 01 April 2024    |           | 50.43           | 16.62         | 0.39     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 4  | 30   | 01 May 2024      |           | 33.71           | 16.72         | 0.29     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 5  | 31   | 01 June 2024     |           | 16.9            | 16.81         | 0.2      | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 16.9          | 0.1      | 0.0  | 0.0       | 17.0  | 0.0  | 0.0        | 0.0  | 17.0        |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 100.0         | 2.05     | 0.0  | 0.0       | 102.05 | 0.0  | 0.0        | 0.0  | 102.05      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
    #    --- 2nd disbursement ---
    When Admin sets the business date to "10 February 2024"
    And Admin successfully disburse the loan on "10 February 2024" with "100" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2024 |           | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 0.0  | 0.0        | 0.0  | 17.01       |
      |    |      | 10 February 2024 |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 2  | 29   | 01 March 2024    |           | 147.14          | 36.43         | 0.89     | 0.0  | 0.0       | 37.32 | 0.0  | 0.0        | 0.0  | 37.32       |
      | 3  | 31   | 01 April 2024    |           | 110.68          | 36.46         | 0.86     | 0.0  | 0.0       | 37.32 | 0.0  | 0.0        | 0.0  | 37.32       |
      | 4  | 30   | 01 May 2024      |           | 74.01           | 36.67         | 0.65     | 0.0  | 0.0       | 37.32 | 0.0  | 0.0        | 0.0  | 37.32       |
      | 5  | 31   | 01 June 2024     |           | 37.12           | 36.89         | 0.43     | 0.0  | 0.0       | 37.32 | 0.0  | 0.0        | 0.0  | 37.32       |
      | 6  | 30   | 01 July 2024     |           | 0.0             | 37.12         | 0.22     | 0.0  | 0.0       | 37.34 | 0.0  | 0.0        | 0.0  | 37.34       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 200.0         | 3.63     | 0.0  | 0.0       | 203.63 | 0.0  | 0.0        | 0.0  | 203.63      |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 10 February 2024 | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        | false    | false    |
    #    --- late payment comes with full amount ---
    When Admin sets the business date to "15 March 2024"
    And Customer makes "AUTOPAY" repayment on "15 March 2024" with 54.33 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date     | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late  | Outstanding |
      |    |      | 01 January 2024  |               | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 1  | 31   | 01 February 2024 | 15 March 2024 | 83.57           | 16.43         | 0.58     | 0.0  | 0.0       | 17.01 | 17.01 | 0.0        | 17.01 | 0.0         |
      |    |      | 10 February 2024 |               | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |       |             |
      | 2  | 29   | 01 March 2024    | 15 March 2024 | 147.14          | 36.43         | 0.89     | 0.0  | 0.0       | 37.32 | 37.32 | 0.0        | 37.32 | 0.0         |
      | 3  | 31   | 01 April 2024    |               | 110.68          | 36.46         | 0.86     | 0.0  | 0.0       | 37.32 | 0.0   | 0.0        | 0.0   | 37.32       |
      | 4  | 30   | 01 May 2024      |               | 74.01           | 36.67         | 0.65     | 0.0  | 0.0       | 37.32 | 0.0   | 0.0        | 0.0   | 37.32       |
      | 5  | 31   | 01 June 2024     |               | 37.12           | 36.89         | 0.43     | 0.0  | 0.0       | 37.32 | 0.0   | 0.0        | 0.0   | 37.32       |
      | 6  | 30   | 01 July 2024     |               | 0.0             | 37.12         | 0.22     | 0.0  | 0.0       | 37.34 | 0.0   | 0.0        | 0.0   | 37.34       |
    Then Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid  | In advance | Late  | Outstanding |
      | 200.0         | 3.63     | 0.0  | 0.0       | 203.63 | 54.33 | 0.0        | 54.33 | 149.3       |
    Then Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 10 February 2024 | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 200.0        | false    | false    |
      | 15 March 2024    | Repayment        | 54.33  | 52.86     | 1.47     | 0.0  | 0.0       | 147.14       | false    | false    |

  @TestRailId:C3334
  Scenario: Verify that COB works properly while creating accruals for a overpaid account (accruals created on COB not when charge is created)
    When Admin sets the business date to "20 October 2024"
    And Admin creates a client with random data
    And Admin set "LP1_ADV_PMT_ALLOC_PROGRESSIVE_LOAN_SCHEDULE_HORIZONTAL" loan product "DEFAULT" transaction type to "LAST_INSTALLMENT" future installment allocation rule
    When Admin creates a fully customized loan with the following data:
      | LoanProduct                                            | submitted on date | with Principal | ANNUAL interest rate % | interest type | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP1_ADV_PMT_ALLOC_PROGRESSIVE_LOAN_SCHEDULE_HORIZONTAL | 20 October 2024   | 100            | 0                      | FLAT          | SAME_AS_REPAYMENT_PERIOD    | EQUAL_INSTALLMENTS | 30                | DAYS                  | 30             | DAYS                   | 1                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "20 October 2024" with "100" amount and expected disbursement date on "20 October 2024"
    And Admin successfully disburse the loan on "20 October 2024" with "100" EUR transaction amount
    And Admin runs inline COB job for Loan
    And Admin sets the business date to "21 October 2024"
    And Admin runs inline COB job for Loan
    And Admin sets the business date to "22 October 2024"
    And Customer makes "AUTOPAY" repayment on "22 October 2024" with 102 EUR transaction amount
    Then Loan status will be "OVERPAID"
    And Loan has 2 overpaid amount
    When Admin sets the business date to "23 October 2024"
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 20 October 2024  |                 | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 30   | 19 November 2024 | 22 October 2024 | 0.0             | 100.0         | 0.0      | 0.0  | 0.0       | 100.0 | 100.0 | 100.0      | 0.0  | 0.0         |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.0      | 0.0  | 0.0       | 100.0 | 100.0 | 100.0      | 0.0  | 0.0         |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 20 October 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 22 October 2024  | Repayment        | 102.0  | 100.0     | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin adds "LOAN_NSF_FEE" due date charge with "23 October 2024" due date and 20 EUR transaction amount
    Then Loan status will be "ACTIVE"
    And Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 20 October 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 30   | 19 November 2024 |           | 0.0             | 100.0         | 0.0      | 0.0  | 20.0      | 120.0 | 102.0 | 102.0      | 0.0  | 18.0        |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.0      | 0.0  | 20.0      | 120.0 | 102.0 | 102.0      | 0.0  | 18.0        |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 20 October 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 22 October 2024  | Repayment        | 102.0  | 100.0     | 0.0      | 0.0  | 2.0       | 0.0          | false    | true     |
    And Loan Charges tab has the following data:
      | Name    | isPenalty | Payment due at     | Due as of       | Calculation type | Due  | Paid | Waived | Outstanding |
      | NSF fee | true      | Specified due date | 23 October 2024 | Flat             | 20.0 | 2.0  | 0.0    | 18.0        |
    When Admin sets the business date to "24 October 2024"
    And Admin runs inline COB job for Loan
    Then Loan status will be "ACTIVE"
    Then Loan Repayment schedule has 1 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 20 October 2024  |           | 100.0           |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 30   | 19 November 2024 |           | 0.0             | 100.0         | 0.0      | 0.0  | 20.0      | 120.0 | 102.0 | 102.0      | 0.0  | 18.0        |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      | 100.0         | 0.0      | 0.0  | 20.0      | 120.0 | 102.0 | 102.0      | 0.0  | 18.0        |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 20 October 2024  | Disbursement     | 100.0  | 0.0       | 0.0      | 0.0  | 0.0       | 100.0        | false    | false    |
      | 22 October 2024  | Repayment        | 102.0  | 100.0     | 0.0      | 0.0  | 2.0       | 0.0          | false    | true     |
      | 23 October 2024  | Accrual          | 20.0   | 0.0       | 0.0      | 0.0  | 20.0      | 0.0          | false    | false    |
    And Loan Charges tab has the following data:
      | Name    | isPenalty | Payment due at     | Due as of       | Calculation type | Due  | Paid | Waived | Outstanding |
      | NSF fee | true      | Specified due date | 23 October 2024 | Flat             | 20.0 | 2.0  | 0.0    | 18.0        |
    When Admin set "LP1_ADV_PMT_ALLOC_PROGRESSIVE_LOAN_SCHEDULE_HORIZONTAL" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule

  @TestRailId:C3384
  Scenario: Verify the repayment schedule in case of interest bearing loan, interest recalculation enabled, 12 months loan, Merchant issued refund (next installment) on disbursement date
    When Admin sets the business date to "01 January 2025"
    And Admin creates a client with random data
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "MERCHANT_ISSUED_REFUND" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2025   | 1000           | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 12                | MONTHS                | 1              | MONTHS                 | 12                 | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2025" with "1000" amount and expected disbursement date on "01 January 2025"
    And Admin successfully disburse the loan on "01 January 2025" with "1000" EUR transaction amount
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 12 periods, with the following data for periods:
      | Nr | Days | Date              | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2025   |           | 1000.0          |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2025  |           | 919.3           | 80.7          | 5.83     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 2  | 28   | 01 March 2025     |           | 838.13          | 81.17         | 5.36     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 3  | 31   | 01 April 2025     |           | 756.49          | 81.64         | 4.89     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 4  | 30   | 01 May 2025       |           | 674.37          | 82.12         | 4.41     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 5  | 31   | 01 June 2025      |           | 591.77          | 82.6          | 3.93     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 6  | 30   | 01 July 2025      |           | 508.69          | 83.08         | 3.45     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 7  | 31   | 01 August 2025    |           | 425.13          | 83.56         | 2.97     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 8  | 31   | 01 September 2025 |           | 341.08          | 84.05         | 2.48     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 9  | 30   | 01 October 2025   |           | 256.54          | 84.54         | 1.99     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 10 | 31   | 01 November 2025  |           | 171.51          | 85.03         | 1.5      | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 11 | 30   | 01 December 2025  |           | 85.98           | 85.53         | 1.0      | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 12 | 31   | 01 January 2026   |           | 0.0             | 85.98         | 0.5      | 0.0  | 0.0       | 86.48 | 0.0  | 0.0        | 0.0  | 86.48       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 38.31    | 0.0  | 0.0       | 1038.31 | 0.0  | 0.0        | 0.0  | 1038.31     |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2025  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "01 January 2025" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 12 periods, with the following data for periods:
      | Nr | Days | Date              | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2025   |                 | 1000.0          |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2025  | 01 January 2025 | 913.47          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 2  | 28   | 01 March 2025     | 01 January 2025 | 826.94          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2025     | 01 January 2025 | 740.41          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2025       | 01 January 2025 | 653.88          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2025      | 01 January 2025 | 567.35          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2025      | 01 January 2025 | 480.82          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 7  | 31   | 01 August 2025    | 01 January 2025 | 394.29          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 8  | 31   | 01 September 2025 | 01 January 2025 | 307.76          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 9  | 30   | 01 October 2025   | 01 January 2025 | 221.23          | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 10 | 31   | 01 November 2025  | 01 January 2025 | 134.7           | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 11 | 30   | 01 December 2025  | 01 January 2025 | 48.17           | 86.53         | 0.0      | 0.0  | 0.0       | 86.53 | 86.53 | 86.53      | 0.0  | 0.0         |
      | 12 | 31   | 01 January 2026   | 01 January 2025 | 0.0             | 48.17         | 0.0      | 0.0  | 0.0       | 48.17 | 48.17 | 48.17      | 0.0  | 0.0         |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 0.0      | 0.0  | 0.0       | 1000.0 | 1000.0 | 1000.0     | 0.0  | 0.0         |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2025  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 January 2025  | Merchant Issued Refund | 1000.0 | 1000.0    | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "MERCHANT_ISSUED_REFUND" transaction type to "REAMORTIZATION" future installment allocation rule

  @TestRailId:C3385
  Scenario: Verify the repayment schedule in case of interest bearing loan, interest recalculation enabled, 12 months loan, Merchant issued refund (reamortization) on disbursement date
    When Admin sets the business date to "01 January 2025"
    And Admin creates a client with random data
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1" loan product "MERCHANT_ISSUED_REFUND" transaction type to "REAMORTIZATION" future installment allocation rule
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                                    | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_360_30_INTEREST_RECALCULATION_DAILY_TILL_PRECLOSE_PMT_ALLOC_1 | 01 January 2025   | 1000           | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 12                | MONTHS                | 1              | MONTHS                 | 12                 | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "01 January 2025" with "1000" amount and expected disbursement date on "01 January 2025"
    And Admin successfully disburse the loan on "01 January 2025" with "1000" EUR transaction amount
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 12 periods, with the following data for periods:
      | Nr | Days | Date              | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid | In advance | Late | Outstanding |
      |    |      | 01 January 2025   |           | 1000.0          |               |          | 0.0  |           | 0.0   | 0.0  |            |      |             |
      | 1  | 31   | 01 February 2025  |           | 919.3           | 80.7          | 5.83     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 2  | 28   | 01 March 2025     |           | 838.13          | 81.17         | 5.36     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 3  | 31   | 01 April 2025     |           | 756.49          | 81.64         | 4.89     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 4  | 30   | 01 May 2025       |           | 674.37          | 82.12         | 4.41     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 5  | 31   | 01 June 2025      |           | 591.77          | 82.6          | 3.93     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 6  | 30   | 01 July 2025      |           | 508.69          | 83.08         | 3.45     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 7  | 31   | 01 August 2025    |           | 425.13          | 83.56         | 2.97     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 8  | 31   | 01 September 2025 |           | 341.08          | 84.05         | 2.48     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 9  | 30   | 01 October 2025   |           | 256.54          | 84.54         | 1.99     | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 10 | 31   | 01 November 2025  |           | 171.51          | 85.03         | 1.5      | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 11 | 30   | 01 December 2025  |           | 85.98           | 85.53         | 1.0      | 0.0  | 0.0       | 86.53 | 0.0  | 0.0        | 0.0  | 86.53       |
      | 12 | 31   | 01 January 2026   |           | 0.0             | 85.98         | 0.5      | 0.0  | 0.0       | 86.48 | 0.0  | 0.0        | 0.0  | 86.48       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 1000.0        | 38.31    | 0.0  | 0.0       | 1038.31 | 0.0  | 0.0        | 0.0  | 1038.31     |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2025  | Disbursement     | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
    When Customer makes "MERCHANT_ISSUED_REFUND" transaction with "AUTOPAY" payment type on "01 January 2025" with 1000 EUR transaction amount and system-generated Idempotency key
    Then Loan Repayment schedule has 12 periods, with the following data for periods:
      | Nr | Days | Date              | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due   | Paid  | In advance | Late | Outstanding |
      |    |      | 01 January 2025   |                 | 1000.0          |               |          | 0.0  |           | 0.0   | 0.0   |            |      |             |
      | 1  | 31   | 01 February 2025  | 01 January 2025 | 916.67          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 2  | 28   | 01 March 2025     | 01 January 2025 | 833.34          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 3  | 31   | 01 April 2025     | 01 January 2025 | 750.01          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 4  | 30   | 01 May 2025       | 01 January 2025 | 666.68          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 5  | 31   | 01 June 2025      | 01 January 2025 | 583.35          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 6  | 30   | 01 July 2025      | 01 January 2025 | 500.02          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 7  | 31   | 01 August 2025    | 01 January 2025 | 416.69          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 8  | 31   | 01 September 2025 | 01 January 2025 | 333.36          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 9  | 30   | 01 October 2025   | 01 January 2025 | 250.03          | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 10 | 31   | 01 November 2025  | 01 January 2025 | 166.7           | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 11 | 30   | 01 December 2025  | 01 January 2025 | 83.37           | 83.33         | 0.0      | 0.0  | 0.0       | 83.33 | 83.33 | 83.33      | 0.0  | 0.0         |
      | 12 | 31   | 01 January 2026   | 01 January 2025 | 0.0             | 83.37         | 0.0      | 0.0  | 0.0       | 83.37 | 83.37 | 83.37      | 0.0  | 0.0         |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 1000.0        | 0.0      | 0.0  | 0.0       | 1000.0 | 1000.0 | 1000.0     | 0.0  | 0.0         |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type       | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 01 January 2025  | Disbursement           | 1000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1000.0       | false    | false    |
      | 01 January 2025  | Merchant Issued Refund | 1000.0 | 1000.0    | 0.0      | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3387
  Scenario: Verify that no negative amount is calculated for Accruals
    When Admin sets the business date to "09 December 2024"
    And Admin creates a client with random data
    And Admin set "LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_ACCRUAL_ACTIVITY" loan product "DEFAULT" transaction type to "NEXT_INSTALLMENT" future installment allocation rule
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                     | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_ACCRUAL_ACTIVITY | 09 December 2024  | 800            | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "09 December 2024" with "800" amount and expected disbursement date on "09 December 2024"
    And Admin successfully disburse the loan on "09 December 2024" with "800" EUR transaction amount
    And Admin runs inline COB job for Loan
    And Admin sets the business date to "10 December 2024"
    And Admin runs inline COB job for Loan
    And Admin sets the business date to "11 December 2024"
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 09 December 2024 |           | 800.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 09 January 2025  |           | 668.69          | 131.31        | 4.75     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 2  | 31   | 09 February 2025 |           | 536.61          | 132.08        | 3.98     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 3  | 28   | 09 March 2025    |           | 403.43          | 133.18        | 2.88     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 4  | 31   | 09 April 2025    |           | 269.77          | 133.66        | 2.4      | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 5  | 30   | 09 May 2025      |           | 135.26          | 134.51        | 1.55     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 6  | 31   | 09 June 2025     |           | 0.0             | 135.26        | 0.8      | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 800.0         | 16.36    | 0.0  | 0.0       | 816.36 | 0.0  | 0.0        | 0.0  | 816.36      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 09 December 2024 | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 10 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "08 January 2025"
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 09 December 2024 |           | 800.0           |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 31   | 09 January 2025  |           | 668.69          | 131.31        | 4.75     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 2  | 31   | 09 February 2025 |           | 536.61          | 132.08        | 3.98     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 3  | 28   | 09 March 2025    |           | 403.43          | 133.18        | 2.88     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 4  | 31   | 09 April 2025    |           | 269.77          | 133.66        | 2.4      | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 5  | 30   | 09 May 2025      |           | 135.26          | 134.51        | 1.55     | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
      | 6  | 31   | 09 June 2025     |           | 0.0             | 135.26        | 0.8      | 0.0  | 0.0       | 136.06 | 0.0  | 0.0        | 0.0  | 136.06      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 800.0         | 16.36    | 0.0  | 0.0       | 816.36 | 0.0  | 0.0        | 0.0  | 816.36      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 09 December 2024 | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 10 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "09 January 2025"
    And Customer makes "AUTOPAY" repayment on "09 January 2025" with 136.06 EUR transaction amount
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 09 December 2024 |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 09 January 2025  | 09 January 2025 | 668.69          | 131.31        | 4.75     | 0.0  | 0.0       | 136.06 | 136.06 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 09 February 2025 |                 | 536.61          | 132.08        | 3.98     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 3  | 28   | 09 March 2025    |                 | 403.43          | 133.18        | 2.88     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 4  | 31   | 09 April 2025    |                 | 269.77          | 133.66        | 2.4      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 5  | 30   | 09 May 2025      |                 | 135.26          | 134.51        | 1.55     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 6  | 31   | 09 June 2025     |                 | 0.0             | 135.26        | 0.8      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 800.0         | 16.36    | 0.0  | 0.0       | 816.36 | 136.06 | 0.0        | 0.0  | 680.3       |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 09 December 2024 | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 10 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Repayment        | 136.06 | 131.31    | 4.75     | 0.0  | 0.0       | 668.69       | false    | false    |
    When Admin sets the business date to "10 January 2025"
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 09 December 2024 |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 09 January 2025  | 09 January 2025 | 668.69          | 131.31        | 4.75     | 0.0  | 0.0       | 136.06 | 136.06 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 09 February 2025 |                 | 536.61          | 132.08        | 3.98     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 3  | 28   | 09 March 2025    |                 | 403.43          | 133.18        | 2.88     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 4  | 31   | 09 April 2025    |                 | 269.77          | 133.66        | 2.4      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 5  | 30   | 09 May 2025      |                 | 135.26          | 134.51        | 1.55     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 6  | 31   | 09 June 2025     |                 | 0.0             | 135.26        | 0.8      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 800.0         | 16.36    | 0.0  | 0.0       | 816.36 | 136.06 | 0.0        | 0.0  | 680.3       |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 09 December 2024 | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 10 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Repayment        | 136.06 | 131.31    | 4.75     | 0.0  | 0.0       | 668.69       | false    | false    |
      | 09 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Accrual Activity | 4.75   | 0.0       | 4.75     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "10 January 2025"
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 09 December 2024 |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 09 January 2025  | 09 January 2025 | 668.69          | 131.31        | 4.75     | 0.0  | 0.0       | 136.06 | 136.06 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 09 February 2025 |                 | 536.61          | 132.08        | 3.98     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 3  | 28   | 09 March 2025    |                 | 403.43          | 133.18        | 2.88     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 4  | 31   | 09 April 2025    |                 | 269.77          | 133.66        | 2.4      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 5  | 30   | 09 May 2025      |                 | 135.26          | 134.51        | 1.55     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 6  | 31   | 09 June 2025     |                 | 0.0             | 135.26        | 0.8      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 800.0         | 16.36    | 0.0  | 0.0       | 816.36 | 136.06 | 0.0        | 0.0  | 680.3       |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 09 December 2024 | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 10 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Repayment        | 136.06 | 131.31    | 4.75     | 0.0  | 0.0       | 668.69       | false    | false    |
      | 09 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Accrual Activity | 4.75   | 0.0       | 4.75     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Admin sets the business date to "11 January 2025"
    And Admin runs inline COB job for Loan
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 09 December 2024 |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 09 January 2025  | 09 January 2025 | 668.69          | 131.31        | 4.75     | 0.0  | 0.0       | 136.06 | 136.06 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 09 February 2025 |                 | 536.61          | 132.08        | 3.98     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 3  | 28   | 09 March 2025    |                 | 403.43          | 133.18        | 2.88     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 4  | 31   | 09 April 2025    |                 | 269.77          | 133.66        | 2.4      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 5  | 30   | 09 May 2025      |                 | 135.26          | 134.51        | 1.55     | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
      | 6  | 31   | 09 June 2025     |                 | 0.0             | 135.26        | 0.8      | 0.0  | 0.0       | 136.06 | 0.0    | 0.0        | 0.0  | 136.06      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 800.0         | 16.36    | 0.0  | 0.0       | 816.36 | 136.06 | 0.0        | 0.0  | 680.3       |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 09 December 2024 | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 10 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Repayment        | 136.06 | 131.31    | 4.75     | 0.0  | 0.0       | 668.69       | false    | false    |
      | 09 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Accrual Activity | 4.75   | 0.0       | 4.75     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2025  | Accrual          | 0.13   | 0.0       | 0.13     | 0.0  | 0.0       | 0.0          | false    | false    |
    When Customer makes "AUTOPAY" repayment on "10 January 2025" with 680.3 EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date       | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      |    |      | 09 December 2024 |                 | 800.0           |               |          | 0.0  |           | 0.0    | 0.0    |            |      |             |
      | 1  | 31   | 09 January 2025  | 09 January 2025 | 668.69          | 131.31        | 4.75     | 0.0  | 0.0       | 136.06 | 136.06 | 0.0        | 0.0  | 0.0         |
      | 2  | 31   | 09 February 2025 | 10 January 2025 | 536.61          | 132.08        | 3.98     | 0.0  | 0.0       | 136.06 | 136.06 | 136.06     | 0.0  | 0.0         |
      | 3  | 28   | 09 March 2025    | 10 January 2025 | 403.43          | 133.18        | 2.88     | 0.0  | 0.0       | 136.06 | 136.06 | 136.06     | 0.0  | 0.0         |
      | 4  | 31   | 09 April 2025    | 10 January 2025 | 269.77          | 133.66        | 2.4      | 0.0  | 0.0       | 136.06 | 136.06 | 136.06     | 0.0  | 0.0         |
      | 5  | 30   | 09 May 2025      | 10 January 2025 | 135.26          | 134.51        | 1.55     | 0.0  | 0.0       | 136.06 | 136.06 | 136.06     | 0.0  | 0.0         |
      | 6  | 31   | 09 June 2025     | 10 January 2025 | 0.0             | 135.26        | 0.8      | 0.0  | 0.0       | 136.06 | 136.06 | 136.06     | 0.0  | 0.0         |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid   | In advance | Late | Outstanding |
      | 800.0         | 16.36    | 0.0  | 0.0       | 816.36 | 816.36 | 680.3      | 0.0  | 0.0         |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 09 December 2024 | Disbursement     | 800.0  | 0.0       | 0.0      | 0.0  | 0.0       | 800.0        | false    | false    |
      | 10 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 12 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 13 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 14 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 15 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 16 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 17 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 18 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 19 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 20 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 21 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 22 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 23 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 24 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 25 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 26 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 27 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 28 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 29 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 30 December 2024 | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 31 December 2024 | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 01 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 02 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 03 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 04 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 05 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 06 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 07 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 08 January 2025  | Accrual          | 0.15   | 0.0       | 0.15     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Repayment        | 136.06 | 131.31    | 4.75     | 0.0  | 0.0       | 668.69       | false    | false    |
      | 09 January 2025  | Accrual          | 0.16   | 0.0       | 0.16     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 09 January 2025  | Accrual Activity | 4.75   | 0.0       | 4.75     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2025  | Accrual          | 0.13   | 0.0       | 0.13     | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2025  | Repayment        | 680.3  | 668.69    | 11.61    | 0.0  | 0.0       | 0.0          | false    | false    |
      | 10 January 2025  | Accrual Activity | 11.61  | 0.0       | 11.61    | 0.0  | 0.0       | 0.0          | false    | false    |
      | 11 January 2025  | Accrual          | 11.48  | 0.0       | 11.48    | 0.0  | 0.0       | 0.0          | false    | false    |

  @TestRailId:C3433
  Scenario: Verify partial interest calculated on loan with disbursement date '12 December 2023' and 10000 amount - UC1
    When Admin sets the business date to "12 December 2023"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 12 December 2023   | 10000          | 9.482                   | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "12 December 2023" with "10000" amount and expected disbursement date on "12 December 2023"
    And Admin successfully disburse the loan on "12 December 2023" with "10000" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 12 December 2023 |           | 10000.0         |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 12 January 2024  |           | 8367.33         | 1632.67       | 80.45    | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 2  | 31   | 12 February 2024 |           | 6721.41         | 1645.92       | 67.2     | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 3  | 29   | 12 March 2024    |           | 5058.79         | 1662.62       | 50.5     | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 4  | 31   | 12 April 2024    |           | 3386.3          | 1672.49       | 40.63    | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 5  | 30   | 12 May 2024      |           | 1699.5          | 1686.8        | 26.32    | 0.0  | 0.0       | 1713.12 | 0.0  | 0.0        | 0.0  | 1713.12     |
      | 6  | 31   | 12 June 2024     |           | 0.0             | 1699.5        | 13.65    | 0.0  | 0.0       | 1713.15 | 0.0  | 0.0        | 0.0  | 1713.15     |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      | 10000.0       | 278.75   | 0.0  | 0.0       | 10278.75 | 0.0  | 0.0        | 0.0  | 10278.75    |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount  | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 12 December 2023 | Disbursement     | 10000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 10000.0      | false    | false    |

  @TestRailId:C3434
  Scenario: Verify partial interest calculated on loan with disbursement date '12 December 2023' and 331.77 amount - UC2
    When Admin sets the business date to "12 December 2023"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 12 December 2023  | 331.77         | 10.65                  | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 5                 | MONTHS                | 1              | MONTHS                 | 5                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "12 December 2023" with "331.77" amount and expected disbursement date on "12 December 2023"
    And Admin successfully disburse the loan on "12 December 2023" with "331.77" EUR transaction amount
    Then Loan Repayment schedule has 5 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 12 December 2023 |           | 331.77          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 12 January 2024  |           | 266.63          | 65.14         | 3.0      | 0.0  | 0.0       | 68.14   | 0.0  | 0.0        | 0.0  | 68.14       |
      | 2  | 31   | 12 February 2024 |           | 200.9           | 65.73         | 2.41     | 0.0  | 0.0       | 68.14   | 0.0  | 0.0        | 0.0  | 68.14       |
      | 3  | 29   | 12 March 2024    |           | 134.46          | 66.44         | 1.7      | 0.0  | 0.0       | 68.14   | 0.0  | 0.0        | 0.0  | 68.14       |
      | 4  | 31   | 12 April 2024    |           | 67.53           | 66.93         | 1.21     | 0.0  | 0.0       | 68.14   | 0.0  | 0.0        | 0.0  | 68.14       |
      | 5  | 30   | 12 May 2024      |           | 0.0             | 67.53         | 0.59     | 0.0  | 0.0       | 68.12   | 0.0  | 0.0        | 0.0  | 68.12       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 331.77        | 8.91     | 0.0  | 0.0       | 340.68  | 0.0  | 0.0        | 0.0  | 340.68      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount  | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 12 December 2023 | Disbursement     | 331.77  | 0.0       | 0.0      | 0.0  | 0.0       | 331.77       | false    | false    |

  @TestRailId:C3435
  Scenario: Verify partial interest calculated on loan with disbursement date '23 July 2024' and 15000 amount - UC3
    When Admin sets the business date to "23 July 2024"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 23 July 2024      | 15000          | 12                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 4                 | MONTHS                | 1              | MONTHS                 | 4                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "23 July 2024" with "15000" amount and expected disbursement date on "23 July 2024"
    And Admin successfully disburse the loan on "23 July 2024" with "15000" EUR transaction amount
    Then Loan Repayment schedule has 4 periods, with the following data for periods:
      | Nr | Days | Date              | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 23 July 2024      |           | 15000.0         |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 31   | 23 August 2024    |           | 11307.31        | 3692.69       | 152.46   | 0.0  | 0.0       | 3845.15 | 0.0  | 0.0        | 0.0  | 3845.15     |
      | 2  | 31   | 23 September 2024 |           | 7577.09         | 3730.22       | 114.93   | 0.0  | 0.0       | 3845.15 | 0.0  | 0.0        | 0.0  | 3845.15     |
      | 3  | 30   | 23 October 2024   |           | 3806.47         | 3770.62       | 74.53    | 0.0  | 0.0       | 3845.15 | 0.0  | 0.0        | 0.0  | 3845.15     |
      | 4  | 31   | 23 November 2024  |           | 0.0             | 3806.47       | 38.69    | 0.0  | 0.0       | 3845.16 | 0.0  | 0.0        | 0.0  | 3845.16     |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      | 15000.0       | 380.61   | 0.0  | 0.0       | 15380.61 | 0.0  | 0.0        | 0.0  | 15380.61    |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount  | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 23 July 2024     | Disbursement     | 15000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 15000.0      | false    | false    |

  @TestRailId:C3436
  Scenario: Verify interest calculated on loan that disbursed on 31 date with disbursement date '31 October 2023' and 2450 amount - UC4
    When Admin sets the business date to "31 October 2023"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 31 October 2023   | 2450           | 9.99                   | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "31 October 2023" with "2450" amount and expected disbursement date on "31 October 2023"
    And Admin successfully disburse the loan on "31 October 2023" with "2450" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 31 October 2023  |           | 2450.0          |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 30   | 30 November 2023 |           | 2049.84         | 400.16        | 20.12    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 2  | 31   | 31 December 2023 |           | 1646.95         | 402.89        | 17.39    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 3  | 31   | 31 January 2024  |           | 1240.61         | 406.34        | 13.94    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 4  | 29   | 29 February 2024 |           | 830.15          | 410.46        | 9.82     | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 5  | 31   | 31 March 2024    |           | 416.89          | 413.26        | 7.02     | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 6  | 30   | 30 April 2024    |           | 0.0             | 416.89        | 3.41     | 0.0  | 0.0       | 420.3  | 0.0  | 0.0        | 0.0  | 420.3       |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      | 2450.0        | 71.7     | 0.0  | 0.0       | 2521.7 | 0.0  | 0.0        | 0.0  | 2521.7      |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 31 October 2023  | Disbursement     | 2450.0 | 0.0       | 0.0      | 0.0  | 0.0       | 2450.0       | false    | false    |

  @TestRailId:C3437
  Scenario: Verify interest calculated on loan that disbursed on 31 date with backdated disbursement date '31 October 2023' and 2450 amount - UC5
    When Admin sets the business date to "21 January 2025"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 31 October 2023   | 2450           | 9.99                   | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "31 October 2023" with "2450" amount and expected disbursement date on "31 October 2023"
    And Admin successfully disburse the loan on "31 October 2023" with "2450" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due    | Paid | In advance | Late | Outstanding |
      |    |      | 31 October 2023  |           | 2450.0          |               |          | 0.0  |           | 0.0    | 0.0  |            |      |             |
      | 1  | 30   | 30 November 2023 |           | 2049.84         | 400.16        | 20.12    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 2  | 31   | 31 December 2023 |           | 1650.35         | 399.49        | 20.79    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 3  | 31   | 31 January 2024  |           | 1250.8          | 399.55        | 20.73    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 4  | 29   | 29 February 2024 |           | 849.91          | 400.89        | 19.39    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 5  | 31   | 31 March 2024    |           | 450.36          | 399.55        | 20.73    | 0.0  | 0.0       | 420.28 | 0.0  | 0.0        | 0.0  | 420.28      |
      | 6  | 30   | 30 April 2024    |           | 0.0             | 450.36        | 20.06    | 0.0  | 0.0       | 470.42 | 0.0  | 0.0        | 0.0  | 470.42      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 2450.0        | 121.82   | 0.0  | 0.0       | 2571.82 | 0.0  | 0.0        | 0.0  | 2571.82    |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 31 October 2023  | Disbursement     | 2450.0 | 0.0       | 0.0      | 0.0  | 0.0       | 2450.0       | false    | false    |

  @TestRailId:C3438
  Scenario: Verify interest calculated on loan that disbursed on 31 date with disbursement date '31 October 2023' and 245000 amount - UC6
    When Admin sets the business date to "31 October 2023"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 31 October 2023   | 245000         | 45                     | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "31 October 2023" with "245000" amount and expected disbursement date on "31 October 2023"
    And Admin successfully disburse the loan on "31 October 2023" with "245000" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      |    |      | 31 October 2023  |           | 245000.0        |               |          | 0.0  |           | 0.0      | 0.0  |            |      |             |
      | 1  | 30   | 30 November 2023 |           | 207718.37       | 37281.63      | 9061.64  | 0.0  | 0.0       | 46343.27 | 0.0  | 0.0        | 0.0  | 46343.27    |
      | 2  | 31   | 31 December 2023 |           | 169313.93       | 38404.44      | 7938.83  | 0.0  | 0.0       | 46343.27 | 0.0  | 0.0        | 0.0  | 46343.27    |
      | 3  | 31   | 31 January 2024  |           | 129424.02       | 39889.91      | 6453.36  | 0.0  | 0.0       | 46343.27 | 0.0  | 0.0        | 0.0  | 46343.27    |
      | 4  | 29   | 29 February 2024 |           | 87695.46        | 41728.56      | 4614.71  | 0.0  | 0.0       | 46343.27 | 0.0  | 0.0        | 0.0  | 46343.27    |
      | 5  | 31   | 31 March 2024    |           | 44694.68        | 43000.78      | 3342.49  | 0.0  | 0.0       | 46343.27 | 0.0  | 0.0        | 0.0  | 46343.27    |
      | 6  | 30   | 30 April 2024    |           | 0.0             | 44694.68      | 1648.57  | 0.0  | 0.0       | 46343.25 | 0.0  | 0.0        | 0.0  | 46343.25    |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      | 245000.0      | 33059.6  | 0.0  | 0.0       | 278059.6 | 0.0  | 0.0        | 0.0  | 278059.6    |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount   | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 31 October 2023  | Disbursement     | 245000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 245000.0     | false    | false    |

  @TestRailId:C3439
  Scenario: Verify interest calculated on loan that disbursed on 31 date with backdated disbursement date '31 October 2023' and 5000 amount - UC7
    When Admin sets the business date to "21 January 2025"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 31 October 2023   | 5000           | 33.99                  | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "31 October 2023" with "5000" amount and expected disbursement date on "31 October 2023"
    And Admin successfully disburse the loan on "31 October 2023" with "5000" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      |    |      | 31 October 2023  |           | 5000.0          |               |          | 0.0  |           | 0.0     | 0.0  |            |      |             |
      | 1  | 30   | 30 November 2023 |           | 4222.02         | 777.98        | 139.68   | 0.0  | 0.0       | 917.66  | 0.0  | 0.0        | 0.0  | 917.66      |
      | 2  | 31   | 31 December 2023 |           | 3448.7          | 773.32        | 144.34   | 0.0  | 0.0       | 917.66  | 0.0  | 0.0        | 0.0  | 917.66      |
      | 3  | 31   | 31 January 2024  |           | 2674.99         | 773.71        | 143.95   | 0.0  | 0.0       | 917.66  | 0.0  | 0.0        | 0.0  | 917.66      |
      | 4  | 29   | 29 February 2024 |           | 1891.99         | 783.0         | 134.66   | 0.0  | 0.0       | 917.66  | 0.0  | 0.0        | 0.0  | 917.66      |
      | 5  | 31   | 31 March 2024    |           | 1118.28         | 773.71        | 143.95   | 0.0  | 0.0       | 917.66  | 0.0  | 0.0        | 0.0  | 917.66      |
      | 6  | 30   | 30 April 2024    |           | 0.0             | 1118.28       | 139.3    | 0.0  | 0.0       | 1257.58 | 0.0  | 0.0        | 0.0  | 1257.58     |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due     | Paid | In advance | Late | Outstanding |
      | 5000.0        | 845.88   | 0.0  | 0.0       | 5845.88 | 0.0  | 0.0        | 0.0  | 5845.88     |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 31 October 2023  | Disbursement     | 5000.0 | 0.0       | 0.0      | 0.0  | 0.0       | 5000.0       | false    | false    |

  @TestRailId:C3440
  Scenario: Verify interest calculated on loan that disbursed on 30 date with disbursement date '30 October 2021' and 1500 amount - UC8
    When Admin sets the business date to "30 October 2021"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 30 October 2021   | 1500           | 9.4822                 | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 6                 | MONTHS                | 1              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "30 October 2021" with "1500" amount and expected disbursement date on "30 October 2021"
    And Admin successfully disburse the loan on "30 October 2021" with "1500" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      |    |      | 30 October 2021  |           | 1500.0          |               |          | 0.0  |           | 0.0      | 0.0  |            |      |             |
      | 1  | 31   | 30 November 2021 |           | 1255.13         | 244.87        | 12.08    | 0.0  | 0.0       | 256.95   | 0.0  | 0.0        | 0.0  | 256.95      |
      | 2  | 30   | 30 December 2021 |           | 1007.96         | 247.17        | 9.78     | 0.0  | 0.0       | 256.95   | 0.0  | 0.0        | 0.0  | 256.95      |
      | 3  | 31   | 30 January 2022  |           | 759.13          | 248.83        | 8.12     | 0.0  | 0.0       | 256.95   | 0.0  | 0.0        | 0.0  | 256.95      |
      | 4  | 29   | 28 February 2022 |           | 507.9           | 251.23        | 5.72     | 0.0  | 0.0       | 256.95   | 0.0  | 0.0        | 0.0  | 256.95      |
      | 5  | 30   | 30 March 2022    |           | 254.91          | 252.99        | 3.96     | 0.0  | 0.0       | 256.95   | 0.0  | 0.0        | 0.0  | 256.95      |
      | 6  | 31   | 30 April 2022    |           | 0.0             | 254.91        | 2.05     | 0.0  | 0.0       | 256.96   | 0.0  | 0.0        | 0.0  | 256.96      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      | 1500.0        | 41.71    | 0.0  | 0.0       | 1541.71  | 0.0  | 0.0        | 0.0  | 1541.71     |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 30 October 2021  | Disbursement     | 1500.0 | 0.0       | 0.0      | 0.0  | 0.0       | 1500.0     | false    | false    |

  @TestRailId:C3441
  Scenario: Verify interest calculated on loan that disbursed on 29 date with disbursement date '29 October 2022' and 5000 amount - UC9
    When Admin sets the business date to "29 October 2022"
    And Admin creates a client with random data
    And Admin creates a fully customized loan with the following data:
      | LoanProduct                                                                 | submitted on date | with Principal | ANNUAL interest rate % | interest type     | interest calculation period | amortization type  | loanTermFrequency | loanTermFrequencyType | repaymentEvery | repaymentFrequencyType | numberOfRepayments | graceOnPrincipalPayment | graceOnInterestPayment | interest free period | Payment strategy            |
      | LP2_ADV_PYMNT_INTEREST_DAILY_EMI_ACTUAL_ACTUAL_INTEREST_RECALCULATION_DAILY | 29 October 2022   | 5000           | 7                      | DECLINING_BALANCE | DAILY                       | EQUAL_INSTALLMENTS | 12                | MONTHS                | 2              | MONTHS                 | 6                  | 0                       | 0                      | 0                    | ADVANCED_PAYMENT_ALLOCATION |
    And Admin successfully approves the loan on "29 October 2022" with "5000" amount and expected disbursement date on "29 October 2022"
    And Admin successfully disburse the loan on "29 October 2022" with "5000" EUR transaction amount
    Then Loan Repayment schedule has 6 periods, with the following data for periods:
      | Nr | Days | Date             | Paid date | Balance of loan | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      |    |      | 29 October 2022  |           | 5000.0          |               |          | 0.0  |           | 0.0      | 0.0  |            |      |             |
      | 1  | 61   | 29 December 2022 |           | 4190.81         | 809.19        | 58.49    | 0.0  | 0.0       | 867.68   | 0.0  | 0.0        | 0.0  | 867.68      |
      | 2  | 61   | 28 February 2023 |           | 3372.16         | 818.65        | 49.03    | 0.0  | 0.0       | 867.68   | 0.0  | 0.0        | 0.0  | 867.68      |
      | 3  | 60   | 29 April 2023    |           | 2543.28         | 828.88        | 38.8     | 0.0  | 0.0       | 867.68   | 0.0  | 0.0        | 0.0  | 867.68      |
      | 4  | 61   | 29 June 2023     |           | 1705.35         | 837.93        | 29.75    | 0.0  | 0.0       | 867.68   | 0.0  | 0.0        | 0.0  | 867.68      |
      | 5  | 61   | 29 August 2023   |           | 857.62          | 847.73        | 19.95    | 0.0  | 0.0       | 867.68   | 0.0  | 0.0        | 0.0  | 867.68      |
      | 6  | 61   | 29 October 2023  |           | 0.0             | 857.62        | 10.03    | 0.0  | 0.0       | 867.65   | 0.0  | 0.0        | 0.0  | 867.65      |
    And Loan Repayment schedule has the following data in Total row:
      | Principal due | Interest | Fees | Penalties | Due      | Paid | In advance | Late | Outstanding |
      | 5000.0        | 206.05   | 0.0  | 0.0       | 5206.05  | 0.0  | 0.0        | 0.0  | 5206.05     |
    And Loan Transactions tab has the following data:
      | Transaction date | Transaction Type | Amount  | Principal | Interest | Fees | Penalties | Loan Balance | Reverted | Replayed |
      | 29 October 2022  | Disbursement     | 5000.0  | 0.0       | 0.0      | 0.0  | 0.0       | 5000.0       | false    | false    |

