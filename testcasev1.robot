*** Settings ***
Library  OperatingSystem 
Library  RequestsLibrary
Library  String
Library  Collections
 
#Suite Setup           Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Request Posts List All Data
    Create Session    jsonplaceholder   ${host}
    
    ${resp_json}=     GET On Session     jsonplaceholder    /posts      expected_status=200

    Should Be Equal As Strings           ${resp_json.reason}    OK 
    #Dictionary Should Contain Value      ${resp_json.json()}    sunt aut facere repellat provident occaecati excepturi optio reprehenderit
    
 
Get Request Posts Data By Id1
    Create Session    jsonplaceholder   ${host}
 
    ${resp_json}=     GET On Session     jsonplaceholder    /posts/1    expected_status=200

    Should Be Equal As Strings           ${resp_json.reason}    OK
    Dictionary Should Contain Value      ${resp_json.json()}    sunt aut facere repellat provident occaecati excepturi optio reprehenderit
 

Get Request Posts Data By Id2
    Create Session    jsonplaceholder   ${host}
 
    ${resp_json}=     GET On Session     jsonplaceholder    /posts/2    expected_status=200

    Should Be Equal As Strings           ${resp_json.reason}    OK
    Dictionary Should Contain Value      ${resp_json.json()}    qui est esse


Get Request Posts Comments By Id1 Count Success
    Create Session    jsonplaceholder   ${host}
 
    ${resp_json}=     GET On Session     jsonplaceholder    posts/1/comments   expected_status=200

    Should Be Equal As Strings           ${resp_json.reason}    OK
    Length Should Be                     ${resp_json.json()}  5


Get Request Posts Comments By Id1 Count Failed
    Create Session    jsonplaceholder   ${host}
 
    ${resp_json}=     GET On Session     jsonplaceholder    posts/1/comments   expected_status=200

    Should Be Equal As Strings           ${resp_json.reason}    OK
    Length Should Be                     ${resp_json.json()}   6



Get Request Posts List By Id1 Failed 
    Create Session    jsonplaceholder   ${host}
 
    ${resp_json}=     GET On Session     jsonplaceholder    posts/1   expected_status=200
 
    Should Be Equal As Strings  ${resp_json.status_code}  404

   
 
*** Variables ***
${host}  http://jsonplaceholder.typicode.com
