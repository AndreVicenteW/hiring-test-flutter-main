import 'dart:convert';

import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/dtos/instrument_dto.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

final getInstrumentsListMock = {
  "m": 0,
  "i": 0,
  "n": getInstrumentsMethod,
  "o": json.decode("["
      '{"OMSId":1,"InstrumentId":1,"Symbol":"BTC/BRL","Product1":1,"Product1Symbol":"BTC","Product2":2,"Product2Symbol":"BRL","InstrumentType":"Standard","VenueInstrumentId":1,"VenueId":1,"SortIndex":0,"SessionStatus":"Running","PreviousSessionStatus":"Paused","SessionStatusDateTime":"2020-07-11T01:27:02.851Z","SelfTradePrevention":true,"QuantityIncrement":1e-8,"PriceIncrement":0.001,"MinimumQuantity":1e-8,"MinimumPrice":0.001,"VenueSymbol":"BTC/BRL","IsDisable":false,"MasterDataId":0,"PriceCollarThreshold":0,"PriceCollarPercent":0,"PriceCollarEnabled":false,"PriceFloorLimit":0,"PriceFloorLimitEnabled":false,"PriceCeilingLimit":0,"PriceCeilingLimitEnabled":false,"CreateWithMarketRunning":true,"AllowOnlyMarketMakerCounterParty":false},'
      '{"OMSId":1,"InstrumentId":2,"Symbol":"LTC/BRL","Product1":3,"Product1Symbol":"LTC","Product2":2,"Product2Symbol":"BRL","InstrumentType":"Standard","VenueInstrumentId":3,"VenueId":1,"SortIndex":0,"SessionStatus":"Running","PreviousSessionStatus":"Paused","SessionStatusDateTime":"2020-07-11T01:27:50.427Z","SelfTradePrevention":true,"QuantityIncrement":1e-8,"PriceIncrement":0.001,"MinimumQuantity":1e-8,"MinimumPrice":0.001,"VenueSymbol":"LTC/BRL","IsDisable":false,"MasterDataId":0,"PriceCollarThreshold":0,"PriceCollarPercent":0,"PriceCollarEnabled":false,"PriceFloorLimit":0,"PriceFloorLimitEnabled":false,"PriceCeilingLimit":0,"PriceCeilingLimitEnabled":false,"CreateWithMarketRunning":true,"AllowOnlyMarketMakerCounterParty":false}'
      ']'),
};

final subscribeLevel1MethodMock = {
  "m": 0,
  "i": 0,
  "n": subscribeLevel1Method,
  "o": {
    "OMSId": 1,
    "InstrumentId": 1,
    "BestBid": 10.1,
    "BestOffer": 20,
    "LastTradedPx": 20,
    "LastTradedQty": 0.1,
    "LastTradeTime": 1614613162,
    "SessionOpen": 130,
    "SessionHigh": 130,
    "SessionLow": 10.1,
    "SessionClose": 10.1,
    "Volume": 0.1,
    "CurrentDayVolume": 0.0005,
    "CurrentDayNumTrades": 1,
    "CurrentDayPxChange": -119.9,
    "Rolling24HrVolume": 0.0005,
    "Rolling24NumTrades": 1,
    "Rolling24HrPxChange": -92.2308,
    "TimeStamp": 1614623773,
  },
};

final instrumentDtoListMock = [
  InstrumentDto(1, 'Test', 0),
  InstrumentDto(2, 'Test', 2),
  InstrumentDto(3, 'Test', 1),
];

final instrumentEntityListMock = [
  InstrumentEntity(id: 1, symbol: 'Test', index: 1),
  InstrumentEntity(id: 2, symbol: 'Test', index: 2),
  InstrumentEntity(id: 4, symbol: 'Test', index: 3),
];

final instrumentEntityMock = InstrumentEntity(
  id: 1,
  symbol: 'Test',
  index: 0,
);

final instrumentDetailsEntityMock = InstrumentDetailsEntity(
  instrumentId: 1,
  lastTradedPx: 20,
  rolling24HrVolume: 20,
  rolling24HrPxChange: 20,
);
