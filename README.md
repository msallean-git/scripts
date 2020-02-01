# scripts

This is the repository where I am storing data scripts that may be usefull for automating work tasks. It has been configured to allow other members to be able to create their own branches and run their own scripts. Certianly in the early stages but hopefully there will be more usefull scripts soon.

In order to run data scripts please contact me (michael.sallean@onit.com) and I will give you access to the script run_local.sh that will allow you to clone the repo locally and run the scripts on your machine. 

To run a Data Script from the terminal navigate to the correct directory and run run_local.sh by typing ./run_local.sh with the correct parameters. The script params formatted as follows:

$ ./run_local.sh branch directory script_file.rb script_param1 script_param2 script_param3 ... script_param_n

There are example commands in the section for each script.

------------------------------------------------------------------------------------------------------------

docusign_stage_jwt.rb


Script to return an verify JWT token in DocuSign Demo account.
Directory: api_helpers
Params: 
	Integration Key - GUID found in admin page of Docusign Demo Account under API and Keys.
	User ID - GUID found in admin page of Docusign Demo Account under API and Keys.
	Private Key - Needs to be passed as string, so surround with single quotes. This key can be found under the integration key settings under RSA Keypairs. We do not need the Public key for this script.
Ex.
	$ ./run_local.sh master api_helpers docusign_stage_jwt.rb 2aedcfab-f1ab-4ae7-b156-4fdffb4aab4d b5796d89-fb1c-4ff8-9dda-f8924a146fa3 '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAsZhM5TeV/xyRy0AU8FVDyxPpdY5R5yt0QdkitZcNGw1ITg5q
g0/U49yATGNd1l3WkVR1vFu0JVnDqNvzpsEq1Tq7bEhNRbxI/hy0PSmDdq+LrZeO
188N2ybVDr4spNysyv0rtJCe4G4TjGLRPEEke3S7cIFZydqxizHkIa7/Bws4rWCK
rj5MgjpIxWQ7RB+ia4z+aFYdcyQ4XSDLlWYX5dhfW2J5/7llT1JH4GOkRD4iLmjs
Y1wJVhLBQu7vF5Bx1jree3gu/v69fzQ4K5FoXQnYN878PmzizmUH52urvykEhRkx
umnBKrn8KpkKY2ZC0AzBr2EYtJ1ohw6eQr3znQIDAQABAoIBAFHmSXfflYXLmBSi
XcWjnJr3eM9krbKs4HVJfG8/1KRoELMmhMo/s47NbkFMBcdJCR2GVLFjnQUoi0nA
/XEmXeltp2c9RJ1nQkYl2JzoGx9Nv11zqkUt0FcDZnfhDdeNiQYnkNM5antXaB5y
p8lgxUFFyPcOP+kNuJjXjjxWZnfJVq6KlHxlntc3sgKK5RKnaxhVHby4/c8fuXoF
SJIjmieOms9HBkSINQbCmMkgQzIJ9bHR0EpWkGbSlOO5Mn6CzTIlNhqj7V4Mwc8o
FccHVXy+jjSeBgY2cEWnxWi6tKFQ38bfEoHc4T7lD7VG978r6MyDSMg90XXbtoW+
FXUu4cUCgYEA+zle2OLhkYOb4WNCJtn/Ts0tL8MzWmbSHRYiW6QKmxAiGr7GD0QM
NVTtIqMtyjS59cnxX4gf76g4fXMlPOvY+eRxsNXX8xg/6I0hmyOz0e3I5UIcVaHs
HoRbfbNrmGZy1TkyGCm/yWg3ea/wdpZwCCiPqD7oC0Q8un4vbzm4c5MCgYEAtPiZ
feWI5sMrTnhPMjnBnPLhn55yTXp5Lwp1TAZcx/c0s7537jBEYyOw/AqkT6kiNRW9
M34hM1ul1fLJZc3r+Go/fYYZU4rXQvWhk62wZv3K8LaxfCW6QETruT5Kc2rTVJxS
W2FjNJZikj+DPWBS4wH8QzX0V1zVxWAJBpHs2g8CgYBmCvuXpTByZr7eYe7w0QN/
AqAkEmm9gp496kuyZYNZUMhJjMvuT3mWABUCSL3EsH4IdCpy31v5gJ7Rdf/eKv5L
Ipt7dKDuwR7UWt8XoPzdfHRpitzve4HpM2HmQQanNJXYPg82+V5JdOdzqh9GS/zd
k3wmnsaqLOFt7utdhliBuQKBgFrQxnYfUew71Oe0CEo0Ia0ZVZA8ey/WXin1HZfh
OX4/1/q7goPNRQRbTN2umXZAciIhnqjQiuiy/S24gMjN5bTr3KCpQtxhuFSp30O0
zelhQw45ICgk5qqJ66EyWTpCSXsUV1/0J0ykiyLJLJsIU5AH1wgDc3LD66L45o6d
fDaRAoGAIlqLQ8HDQQj2faa+GjdFteDJNrXL5U0aquqxjustWyKoFcESGncB0MLs
28kumPei01PTBHYE/5GnwUkDCBEteT3b80EVUQ4HNp3cvZ1AlhFnv5GeWcpMmIek
mG7rEFqEyC2Gh9rmd69SmB9IyUfz3tU0xqAWWiHzZtlbiE881bY=
-----END RSA PRIVATE KEY-----'

------------------------------------------------------------------------------------------------------------

docusign_prod_jwt.rb


Script to return an verify JWT token in DocuSign Production account.
Directory: api_helpers
Params: 
	Integration Key - GUID found in admin page of Docusign Producation Account under API and Keys.
	User ID - GUID found in admin page of Docusign Demo Account under API and Keys.
	Private Key - Needs to be passed as string, so surround with single quotes. This key can be found under the integration key settings under RSA Keypairs. We do not need the Public key for this script.
Ex.
	$ ./run_local.sh master api_helpers docusign_prod_jwt.rb 2aedcfab-f1ab-4ae7-b156-4fdffb4aab4d b5796d89-fb1c-4ff8-9dda-f8924a146fa3 '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAsZhM5TeV/xyRy0AU8FVDyxPpdY5R5yt0QdkitZcNGw1ITg5q
g0/U49yATGNd1l3WkVR1vFu0JVnDqNvzpsEq1Tq7bEhNRbxI/hy0PSmDdq+LrZeO
188N2ybVDr4spNysyv0rtJCe4G4TjGLRPEEke3S7cIFZydqxizHkIa7/Bws4rWCK
rj5MgjpIxWQ7RB+ia4z+aFYdcyQ4XSDLlWYX5dhfW2J5/7llT1JH4GOkRD4iLmjs
Y1wJVhLBQu7vF5Bx1jree3gu/v69fzQ4K5FoXQnYN878PmzizmUH52urvykEhRkx
umnBKrn8KpkKY2ZC0AzBr2EYtJ1ohw6eQr3znQIDAQABAoIBAFHmSXfflYXLmBSi
XcWjnJr3eM9krbKs4HVJfG8/1KRoELMmhMo/s47NbkFMBcdJCR2GVLFjnQUoi0nA
/XEmXeltp2c9RJ1nQkYl2JzoGx9Nv11zqkUt0FcDZnfhDdeNiQYnkNM5antXaB5y
p8lgxUFFyPcOP+kNuJjXjjxWZnfJVq6KlHxlntc3sgKK5RKnaxhVHby4/c8fuXoF
SJIjmieOms9HBkSINQbCmMkgQzIJ9bHR0EpWkGbSlOO5Mn6CzTIlNhqj7V4Mwc8o
FccHVXy+jjSeBgY2cEWnxWi6tKFQ38bfEoHc4T7lD7VG978r6MyDSMg90XXbtoW+
FXUu4cUCgYEA+zle2OLhkYOb4WNCJtn/Ts0tL8MzWmbSHRYiW6QKmxAiGr7GD0QM
NVTtIqMtyjS59cnxX4gf76g4fXMlPOvY+eRxsNXX8xg/6I0hmyOz0e3I5UIcVaHs
HoRbfbNrmGZy1TkyGCm/yWg3ea/wdpZwCCiPqD7oC0Q8un4vbzm4c5MCgYEAtPiZ
feWI5sMrTnhPMjnBnPLhn55yTXp5Lwp1TAZcx/c0s7537jBEYyOw/AqkT6kiNRW9
M34hM1ul1fLJZc3r+Go/fYYZU4rXQvWhk62wZv3K8LaxfCW6QETruT5Kc2rTVJxS
W2FjNJZikj+DPWBS4wH8QzX0V1zVxWAJBpHs2g8CgYBmCvuXpTByZr7eYe7w0QN/
AqAkEmm9gp496kuyZYNZUMhJjMvuT3mWABUCSL3EsH4IdCpy31v5gJ7Rdf/eKv5L
Ipt7dKDuwR7UWt8XoPzdfHRpitzve4HpM2HmQQanNJXYPg82+V5JdOdzqh9GS/zd
k3wmnsaqLOFt7utdhliBuQKBgFrQxnYfUew71Oe0CEo0Ia0ZVZA8ey/WXin1HZfh
OX4/1/q7goPNRQRbTN2umXZAciIhnqjQiuiy/S24gMjN5bTr3KCpQtxhuFSp30O0
zelhQw45ICgk5qqJ66EyWTpCSXsUV1/0J0ykiyLJLJsIU5AH1wgDc3LD66L45o6d
fDaRAoGAIlqLQ8HDQQj2faa+GjdFteDJNrXL5U0aquqxjustWyKoFcESGncB0MLs
28kumPei01PTBHYE/5GnwUkDCBEteT3b80EVUQ4HNp3cvZ1AlhFnv5GeWcpMmIek
mG7rEFqEyC2Gh9rmd69SmB9IyUfz3tU0xqAWWiHzZtlbiE881bY=
-----END RSA PRIVATE KEY-----'
