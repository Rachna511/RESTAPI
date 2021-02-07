## Purpose:
The purpose of this test is writing all different types of get request test cases

## Auto Testing Objectives:

Robot Framework is a generic keyword-driven test automation framework for acceptance level testing and acceptance test-driven development (ATDD)


Note: 
URL :   https://jsonplaceholder.typicode.com

## Test case details:

Get Request Posts List All Data
    details : I am writing this test for getting all posts from given url

    checking status 200
 

Get Request Posts Data By Id1
    details : I am writing this test for getting posts from given url for post id 1

    checking status 200


Get Request Posts Data By Id2
    details : I am writing this test for getting posts from given url for post id 2

    checking status 200


Get Request Posts Comments By Id1 Count Success
    details : I am writing this test for getting comments for post id 1 
    
    checking status 200
    counting json item length 5


Get Request Posts Comments By Id1 Count Match Failed
    details : I am writing this test for getting comments for post id 1 
    
    checking status 200
    counting json item length 6 against live data count 5

    So, purposely written to show failed test case


Get Request Posts List By Id1 Failed 
    details : I am writing this test for getting comments for post id 1 
    
    checking status 200
    checking status 404 with data

    So, purposely written to show failed test case
