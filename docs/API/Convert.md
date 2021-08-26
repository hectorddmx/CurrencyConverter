https://api.exchangeratesapi.io/v1/convert

Requires paid exchangeratesapi.io account 

To convert currency.
```shell
KEY="xxxxx" # Get one from https://manage.exchangeratesapi.io/dashboard
from="USD"
to="MXN"
amount=2
curl "https://api.exchangeratesapi.io/v1/convert?access_key=${KEY}&from=${from}&to=${to}&amount=${amount}"
```
220 - `result` or `info.rate`
```json
{
  "success": true,
  "query": {
    "from": "USD",
    "to": "MXN",
    "amount": 1
  },
  "info": {
    "timestamp": 1629945723,
    "rate": 20.259197
  },
  "date": "2021-08-26",
  "result": 20.259197
}
```