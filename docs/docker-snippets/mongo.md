# Mongo setups...

Docker:

```bash
docker run -it -d --name mongo-container -p 27017:27017 --network springbankNet --restart always -v mongodb_data_container:/data/db mongo:latest
```

Robo 3T: download links:
 - https://studio3t.com/download-thank-you/?OS=x64


