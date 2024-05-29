workspace "Financial Risk System" "This is a simple (incomplete) example C4 model based upon the financial risk system architecture kata, which can be found at http://bit.ly/sa4d-risksystem" {

    model {
        businessUser = person "Business User" "A regular business user."
        configurationUser = person "Configuration User" "A regular business user who can also configure the parameters used in the risk calculations."

        financialRiskSystem = softwareSystem "Financial Risk System" "Calculates the bank's exposure to risk for product X." "Financial Risk System"  {
            !docs docs
            !adrs adrs
        }

        tradeDataSystem = softwareSystem "Trade Data System" "The system of record for trades of type X."
        referenceDataSystem = softwareSystem "Reference Data System" "Manages reference data for all counterparties the bank interacts with."
        referenceDataSystemV2 = softwareSystem "Reference Data System v2.0" "Manages reference data for all counterparties the bank interacts with." "Future State"
        emailSystem = softwareSystem "E-mail system" {
            
                description "The bank's Microsoft Exchange system."
                
                tags "E-mail"

                loadBalancer = container "Load Balancer"{
                    tags "Google Cloud Platform - Cloud Load Balancing" "GCP"
                }

                emailServer = container "Email Server" {
                    tags "DSRSP"
                    emailApplication = component  "Email Application"{
                        tags "Application"
                    }
                }    
        }
        centralMonitoringService = softwareSystem "Central Monitoring Service" "The bank's central monitoring and alerting dashboard."
        activeDirectory = softwareSystem "Active Directory" "The bank's authentication and authorisation system."

        businessUser -> financialRiskSystem "Views reports using"
        financialRiskSystem -> tradeDataSystem "Gets trade data from"
        financialRiskSystem -> referenceDataSystem "Gets counterparty data from"
        financialRiskSystem -> referenceDataSystemV2 "Gets counterparty data from" "" "Future State"
        configurationUser -> financialRiskSystem "Configures parameters using"
        financialRiskSystem -> loadBalancer "Sends a notification that a report is ready to"
        loadBalancer -> emailApplication
        emailSystem -> businessUser "Sends a notification that a report is ready to" "E-mail message" "Asynchronous"
        financialRiskSystem -> centralMonitoringService "Sends critical failure alerts to" "SNMP" "Asynchronous, Alert"
        financialRiskSystem -> activeDirectory "Uses for user authentication and authorisation"
    }
         
    views {
        systemLandscape SystemOverview1 "System Overview" { 
            include financialRiskSystem businessUser configurationUser
        }
        
        systemContext financialRiskSystem "Context" "An example System Context diagram for the Financial Risk System architecture kata." {
            include *
            autoLayout
        }

        container emailSystem  "emailSystem" {
            include *
        }

        component emailServer  "emailServer" {
            include *
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Software System" {
                background #801515
                shape RoundedBox
            }
            element "Financial Risk System" {
                background #550000
                color #ffffff
            }
            element "Future State" {
                opacity 30
            }
            element "Person" {
                background #d46a6a
                shape Person
            }
            relationship "Relationship" {
                dashed false
            }
            relationship "Asynchronous" {
                dashed true
            }
            relationship "Alert" {
                color #ff0000
            }
            relationship "Future State" {
                opacity 30
            }
       }

        theme default
        themes https://static.structurizr.com/themes/google-cloud-platform-v1.5/theme.json

    }
}