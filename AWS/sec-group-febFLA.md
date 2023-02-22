```

Internet    ------------   Internet Gateway -------  VPC - subnet1---- 
                                                         |    |
                                                         |    |---  sec websv 1   ------ Web1 10.0.0.5
                                                         |    |         If from anywhere to port 80 then ALLOW
                                                         |    |         If from sourceip=87.22.64.9 to p 22 then ALLOW
                                                         |    |         else BLOCK
                                                         |    |---- sec websv 1  ------- Web2 10.0.0.8    
                                                         |    |
                                                         |    |-----sec dbsrv 1 ------- Database 10.0.0.6
                                                         |    |         If from sec=websv 1 to port 3306 then ALLOW
                                                         |    |         Else BLOCK
                                                         |    |
                                                         |    |-----sec email 1 -------- Email  10.0.0.7
                                                         |    |         If from anywhere port 25 then ALLOW
                                                         |              Else BLOCK
                                                         - subnet2 
                                                         |
                                                         |
                                                         |
                                                         |
                                                         |
                                                         |
                                                         - subnet3

```
