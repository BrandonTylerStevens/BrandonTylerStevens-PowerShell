﻿using Microsoft.Crm.Sdk.Messages;
using Microsoft.Xrm.Tooling.Connector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PowerApps.Samples
{
   public partial class SampleProgram
    {
        private static Guid _currentUserId;
        private static Guid _otherUserId;
        private static bool prompt = true;
        /// <summary>
        /// Function to set up the sample.
        /// </summary>
        /// <param name="service">Specifies the service to connect to.</param>
        /// 
        private static void SetUpSample(CrmServiceClient service)
        {
            // Check that the current version is greater than the minimum version
            if (!SampleHelpers.CheckVersion(service, new Version("7.1.0.0")))
            {
                //The environment version is lower than version 7.1.0.0
                return;
            }

            CreateRequiredRecords(service);
        }

        private static void CleanUpSample(CrmServiceClient service)
        {
            DeleteRequiredRecords(service, prompt);
        }

        /// <summary>
        /// This method creates any entity records that this sample requires.        
        /// </summary>
        public static void CreateRequiredRecords(CrmServiceClient service)
        {
            // Get the current user's information.
            WhoAmIRequest userRequest = new WhoAmIRequest();
            WhoAmIResponse userResponse = (WhoAmIResponse)service.Execute(userRequest);
            _currentUserId = userResponse.UserId;

            // Create another user, Kevin Cook.
            _otherUserId = SystemUserProvider.RetrieveSalesManager(service);
        }

        public static void DeleteRequiredRecords(CrmServiceClient service, bool prompt)
        {

        }
    }
}
