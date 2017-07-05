# 把下面的shell脚本直接在终端执行(mac端测试通过)

## 执行以下命令
```bash


# 请先确定~/Work/htdocs/* 你本地的文件已经提交到版本记录里面
# 请先确定~/Work/htdocs/* 你本地的文件已经提交到版本记录里面
# 请先确定~/Work/htdocs/* 你本地的文件已经提交到版本记录里面



git clone https://github.com/mmfei/deploy_env_for_developer;
cd deploy_env_for_developer;
git checkout mobvista;
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

