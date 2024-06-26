CREATE TABLE `data_platform_bus_operation_header_data`
(
  `BusLine`                      int(16) NOT NULL,
  `OperationDate`                date NOT NULL,
  `BusOperationID`               int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `BusOperationVersion`          int(4) DEFAULT NULL,
  `PlannedBusOperationID`        int(4) DEFAULT NULL,
  `DepartureBusStop`             int(16) NOT NULL,
  `DestinationBusStop`           int(16) NOT NULL,
  `PlannedDepartureTime`         time NOT NULL,
  `PlannedArrivalTime`           time NOT NULL,
  `ActualDepartureTime`          time NOT NULL,
  `ActualArrivalTime`            time NOT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `OperationCode`                varchar(40) DEFAULT NULL,
  `ValidityStartDate`            date NOT NULL,
  `ValidityEndDate`              date NOT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`BusLine`, `OperationDate`, `BusOperationID`),

    CONSTRAINT `DPFMBusOperationHeaderData_fk` FOREIGN KEY (`BusLine`) REFERENCES `data_platform_bus_line_header_data` (`BusLine`),
    CONSTRAINT `DPFMBusOperationHeaderDataWeekdayType_fk` FOREIGN KEY (`WeekdayType`) REFERENCES `data_platform_weekday_type_express_type_data` (`WeekdayType`),
    CONSTRAINT `DPFMBusOperationHeaderDataExpressType_fk` FOREIGN KEY (`BusLine`, `ExpressType`) REFERENCES `data_platform_bus_line_express_type_data` (`BusLine`, `ExpressType`),
    CONSTRAINT `DPFMBusOperationHeaderDataPlannedID_fk` FOREIGN KEY (`BusLine`, `BusOperationVersion`, `WeekdayType`, `PlannedBusOperationID`) REFERENCES `data_platform_planned_bus_operation_header_data` (`BusLine`, `BusOperationVersion`, `WeekdayType`, `PlannedBusOperationID`),
    CONSTRAINT `DPFMBusOperationHeaderDataDptBusStop_fk` FOREIGN KEY (`BusLine`, `DepartureBusStop`) REFERENCES `data_platform_bus_stop_header_data` (`BusLine`, `BusStop`),
    CONSTRAINT `DPFMBusOperationHeaderDataDstBusStop_fk` FOREIGN KEY (`BusLine`, `DestinationBusStop`) REFERENCES `data_platform_bus_stop_header_data` (`BusLine`, `BusStop`),
    CONSTRAINT `DPFMBusOperationHeaderDataDptDstBusStop_fk` FOREIGN KEY (`BusLine`, `DepartureBusStop`, `DestinationBusStop`) REFERENCES `data_platform_bus_stop_header_data` (`BusLine`, `DepartureBusStop`, `DestinationBusStop`),
    CONSTRAINT `DPFMBusOperationHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMBusOperationHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
