CREATE TABLE `data_platform_bus_operation_item_data`
(
  `BusLine`                      int(16) NOT NULL,
  `BusOperationVersion`          int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `BusOperationID`               int(4) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `BusLineBusStopID`             int(4) NOT NULL,
  `BusStop`                      int(16) NOT NULL,
  `DepartingTime`                time(16) NOT NULL,
  `ArrivingTime`                 time(16) DEFAULT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`BusLine`, `BusOperationVersion`, `WeekdayType`, `BusOperationID`, `ExpressType`, `BusLineBusStopID`, `BusStop`),

    CONSTRAINT `DPFMBusOperationItemData_fk` FOREIGN KEY (`BusLine`, `BusOperationVersion`, `WeekdayType`, `BusOperationID`, `ExpressType`) REFERENCES `data_platform_bus_operation_header_data` (`BusLine`, `BusOperationVersion`, `WeekdayType`, `BusOperationID`, `ExpressType`),
    CONSTRAINT `DPFMBusOperationItemDataBusStop_fk` FOREIGN KEY (`BusLine`, `BusLineBusStopID`, `BusStop`) REFERENCES `data_platform_bus_line_bus_stop_data` (`BusLine`, `BusLineBusStopID`, `BusStop`),
    CONSTRAINT `DPFMBusOperationItemDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMBusOperationItemDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
