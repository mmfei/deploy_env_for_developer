# 把下面的shell脚本直接在终端执行(mac端测试通过)

## 执行以下命令
```bash
git clone http://gitlab.mobvista.com/lingfei.weng/devops.git;
cd devops;
sh deploy.mac.sh;
```

## 工作目录如下:
```bash
~/Work
├── data
│   ├── mysql
│   │   ├── auto.cnf
│   │   ├── ib_logfile0
│   │   ├── ib_logfile1
│   │   ├── ibdata1
│   │   ├── mysql
│   │   └── performance_schema
│   └── redis
│       └── dump.rdb
├── elasticsearch
│   └── data
├── htdocs
│   ├── adapi.devmobvista.com
│   ├── adnew.devmobvista.com
│   └── default
│       └── phpinfo.php
└── log
    ├── nginx
    │   ├── access.log
    │   └── error.log
    └── php
        ├── fpm-access.log
        └── fpm-error.log
```

