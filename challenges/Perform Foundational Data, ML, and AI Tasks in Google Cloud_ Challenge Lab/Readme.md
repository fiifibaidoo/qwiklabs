1. Run the following command to create a dataset called `bq mk lab_631`
2. Run the following commands to create a bucket `export BICKET_NAME=ad2932a0-8ffb-47c9-96e1-8a1e2ddac6f2 && gsutil mb gs://$BUCKET_NAME`

{
"BigQuery Schema":
[
{"type":"STRING","name":"guid"},
{"type":"BOOLEAN","name":"isActive"},
{"type":"STRING","name":"firstname"},
{"type":"STRING","name":"surname"},
{"type":"STRING","name":"company"},
{"type":"STRING","name":"email"},
{"type":"STRING","name":"phone"},
{"type":"STRING","name":"address"},
{"type":"STRING","name":"about"},
{"type":"TIMESTAMP","name":"registered"},
{"type":"FLOAT","name":"latitude"},
{"type":"FLOAT","name":"longitude"}
]
}


export API_KEY=AIzaSyC_C_27LsC9mTxYR8uhV21jTQQNU_zYw0Q

gsutil cp task4-gcs.result gs://qwiklabs-gcp-03-9b86a10b5736-marking/task4-gcs.result

gsutil cp task4-cnl.result gs://qwiklabs-gcp-03-9b86a10b5736-marking/task4-cnl.result

gsutil cp task4-gvi.result gs://qwiklabs-gcp-03-9b86a10b5736-marking/task4-gvi.result