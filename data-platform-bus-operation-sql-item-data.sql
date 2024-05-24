CREATE TABLE `data_platform_bus_operation_item_data`
(
  `BusLine`                      int(16) NOT NULL,
  `OperationDate`                date NOT NULL,
  `BusOperationID`               int(4) NOT NULL,
  `BusLineBusStopID`             int(4) NOT NULL,
  `BusStop`                      int(16) NOT NULL,
  `PlannedArrivalTime`           time DEFAULT NULL,
  `PlannedDepartureTime`         time NOT NULL,
  `ActualArrivalTime`            time DEFAULT NULL,
  `ActualDepartureTime`          time NOT NULL,
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

    PRIMARY KEY (`BusLine`, `OperationDate`, `BusOperationID`, `BusLineBusStopID`),

    CONSTRAINT `DPFMBusOperationItemData_fk` FOREIGN KEY (`BusLine`, `OperationDate`, `BusOperationID`) REFERENCES `data_platform_bus_operation_header_data` (`BusLine`, `OperationDate`, `BusOperationID`),
    CONSTRAINT `DPFMBusOperationItemDataBusStop_fk` FOREIGN KEY (`BusLine`, `BusLineBusStopID`, `BusStop`) REFERENCES `data_platform_bus_line_bus_stop_data` (`BusLine`, `BusLineBusStopID`, `BusStop`),
    CONSTRAINT `DPFMBusOperationItemDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMBusOperationItemDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
