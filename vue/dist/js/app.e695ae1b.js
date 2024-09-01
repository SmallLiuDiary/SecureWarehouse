(function(){"use strict";var e={7554:function(e,t,a){var s=a(5471),o=a(8505),r=function(){var e=this,t=e._self._c;return t(o.A,[t("router-view")],1)},l=[],i=a(6929),n=a(6521),c=a(7954),u=a(7410),d=a(1735),h=function(){var e=this,t=e._self._c;return t(o.A,[t(i.A,{attrs:{app:"",dense:""}},[t(d.sw,[e._v("数据仓库安全信息管理系统")]),t(u.A),e._l(e.pages,(function(a){return t(n.A,{key:a.title,attrs:{text:""},on:{click:function(t){return e.changePage(a)}}},[e._v(" "+e._s(a.title)+" ")])}))],2),t(c.A,[t("router-view")],1)],1)},p=[],m=(a(4114),{name:"MainLayout",data(){return{pages:[{title:"数据仓库首页",path:"/home"},{title:"数据仓库管理",path:"/manager"},{title:"数据仓库监测",path:"/monitor"},{title:"用户登出",path:"/login"}]}},methods:{changePage(e){this.$router.push(e.path)}}}),b=m,f=a(845),v=(0,f.A)(b,h,p,!1,null,null,null),A=v.exports,w={name:"App",components:{MainLayout:A},data:()=>({})},g=w,_=(0,f.A)(g,r,l,!1,null,null,null),x=_.exports,k=a(173),y=a(1689),W=a(8834),T=a(1526),C=a(6278),$=a(980),U=a(8412),S=function(){var e=this,t=e._self._c;return t(C.A,[t(U.A,[t(T.A,{attrs:{cols:"12"}},[t(y.A,{staticClass:"mb-5",attrs:{color:"blue darken-1",dark:""}},[t(W.ri,{attrs:{"primary-title":""}},[t("div",[t("h2",{staticClass:"headline mb-0"},[e._v("数据仓库管理系统")]),t("p",[e._v("欢迎使用数据仓库管理系统。高效地管理和监控您的数据仓库。")])])])],1)],1)],1),t(U.A,[t(T.A,{attrs:{cols:"12",sm:"6",md:"4"}},[t(y.A,{staticClass:"mx-auto",attrs:{"max-width":"344"}},[t($.A,{staticClass:"white--text align-end",attrs:{height:"200px",src:"https://picsum.photos/344/200"}},[t(W.ri,[e._v("仓库概览")])],1),t(W.ZR,[e._v("管理和监控您的仓库")]),t(W.SL,[t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:function(t){return e.navigateTo("overview")}}},[e._v(" 查看概览 ")])],1)],1)],1),t(T.A,{attrs:{cols:"12",sm:"6",md:"4"}},[t(y.A,{staticClass:"mx-auto",attrs:{"max-width":"344"}},[t($.A,{staticClass:"white--text align-end",attrs:{height:"200px",src:"https://picsum.photos/344/200?random=1"}},[t(W.ri,[e._v("仓库管理")])],1),t(W.ZR,[e._v("创建和删除仓库")]),t(W.SL,[t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:function(t){return e.navigateTo("manager")}}},[e._v(" 管理仓库 ")])],1)],1)],1),t(T.A,{attrs:{cols:"12",sm:"6",md:"4"}},[t(y.A,{staticClass:"mx-auto",attrs:{"max-width":"344"}},[t($.A,{staticClass:"white--text align-end",attrs:{height:"200px",src:"https://picsum.photos/344/200?random=2"}},[t(W.ri,[e._v("仓库监控")])],1),t(W.ZR,[e._v("监控仓库数据")]),t(W.SL,[t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:function(t){return e.navigateTo("monitor")}}},[e._v(" 监控数据 ")])],1)],1)],1)],1)],1)},I=[],D={methods:{navigateTo(e){this.$router.push({path:`/${e}`})}}},z=D,O=(0,f.A)(z,S,I,!1,null,"d20ceeaa",null),E=O.exports,q=a(5512),R=a(4155),j=a(1770),H=a(1906),B=a(8230),P=a(9456),L=a(2987),M=a(1075),F=a(6315),Z=a(1360),N=a(6067),Q=a(24),J=a(4250),V=a(8730),X=a(7891),G=a(2006),K=a(9940),Y=function(){var e=this,t=e._self._c;return t(C.A,{attrs:{fluid:""}},[t(U.A,{attrs:{"no-gutters":""}},[t(T.A,{attrs:{cols:"12",md:"3"}},[t(J.A,{staticClass:"elevation-1",attrs:{permanent:"",app:""}},[t(L.A,{attrs:{dense:""}},[t(G.A,[e._v("仓库操作")]),t(M.A,{on:{click:e.openCreateDialog}},[t(Q.A,[t(P.A,[e._v("mdi-plus")])],1),t(Z.UZ,[e._v("新建数据仓库")])],1),t(M.A,{on:{click:e.deleteWarehouse}},[t(Q.A,[t(P.A,[e._v("mdi-delete")])],1),t(Z.UZ,[e._v("删除数据仓库")])],1),t(j.A),t(G.A,[e._v("我的仓库")]),e._l(e.filteredWarehouses,(function(a){return t(M.A,{key:a.id,class:{highlighted:e.selectedWarehouse===a},on:{click:function(t){return e.selectWarehouse(a)}}},[t(Z.pr,[t(Z.UZ,[e._v(e._s(a))])],1)],1)}))],2)],1)],1),t(U.A,[e.selectedWarehouse?t("div",[t(T.A,[t(L.A,{attrs:{dense:""}},[t(G.A,[e._v(e._s(e.selectedWarehouse)+" Tables "),t(T.A,{staticClass:"text-right"},[t(n.A,{attrs:{color:"primary"},on:{click:function(t){e.showCreateTableDialog=!0}}},[e._v("新建表")])],1)],1),t(N.A,{attrs:{color:"primary"},model:{value:e.selectedTableIndex,callback:function(t){e.selectedTableIndex=t},expression:"selectedTableIndex"}},[e._l(e.tables,(function(a,s){return t(M.A,{key:a},[t(Z.pr,{class:{highlighted:e.selectedTableIndex===s},on:{click:function(t){return e.selectTable(a,s)}}},[t(Z.UZ,[e._v(e._s(a))])],1),t(F.A,[t(n.A,{attrs:{icon:""},on:{click:function(t){return t.stopPropagation(),e.deleteTable(a)}}},[t(P.A,[e._v("mdi-delete")])],1)],1),t(n.A,{attrs:{color:"primary"},on:{click:function(t){e.showAddItem=!0}}},[e._v("新增数据")])],1)})),t(H.Qo,[t(T.A,[e.selectedTable?t(q.A,{staticClass:"elevation-1",attrs:{headers:e.tableHeaders,items:e.tableRows,height:"50vh","fixed-header":!0}}):e._e()],1)],1)],2)],1)],1)],1):t("div",[t("h1",[e._v("欢迎使用我们的数据仓库管理系统！")]),t("p",[e._v("请从左侧选择一个数据仓库以查看详情。")])])])],1),t(R.A,{attrs:{persistent:"","max-width":"600px"},model:{value:e.showCreateDialog,callback:function(t){e.showCreateDialog=t},expression:"showCreateDialog"}},[t(y.A,[t(W.ri,[e._v("新建数据仓库")]),t(W.OQ,[t(C.A,[t(U.A,[t(T.A,{attrs:{cols:"12"}},[t(K.A,{attrs:{label:`仓库名称 (组织: ${e.organization})`,prefix:`${e.organization}_`,required:""},model:{value:e.newWarehouseSuffix,callback:function(t){e.newWarehouseSuffix=t},expression:"newWarehouseSuffix"}})],1),t(T.A,{attrs:{cols:"12"}},[t(V.A,{attrs:{items:e.charsets,"item-text":"label","item-value":"value",label:"选择字符集",required:""},model:{value:e.newWarehouse.charset,callback:function(t){e.$set(e.newWarehouse,"charset",t)},expression:"newWarehouse.charset"}})],1),t(T.A,{attrs:{cols:"12"}},[t(V.A,{attrs:{items:e.collations,"item-text":"label","item-value":"value",label:"选择排序规则",required:""},model:{value:e.newWarehouse.collation,callback:function(t){e.$set(e.newWarehouse,"collation",t)},expression:"newWarehouse.collation"}})],1)],1)],1)],1),t(W.SL,[t(u.A),t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:function(t){e.showCreateDialog=!1,this.resetForm()}}},[e._v("取消")]),t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:e.createWarehouse}},[e._v("创建")])],1)],1)],1),t(R.A,{attrs:{persistent:"","max-width":"600px"},model:{value:e.showCreateTableDialog,callback:function(t){e.showCreateTableDialog=t},expression:"showCreateTableDialog"}},[t(y.A,[t(W.ri,[e._v("新建表")]),t(W.OQ,[t(K.A,{attrs:{label:"表名",required:"",clearable:""},model:{value:e.newTable.name,callback:function(t){e.$set(e.newTable,"name",t)},expression:"newTable.name"}}),t(n.A,{attrs:{color:"primary"},on:{click:e.addNewColumn}},[e._v("添加列")]),t(X.A,{scopedSlots:e._u([{key:"default",fn:function(){return[t("thead",[t("tr",[t("th",{staticClass:"text-left"},[e._v("列名")]),t("th",{staticClass:"text-left"},[e._v("数据类型")]),t("th",{staticClass:"text-left"},[e._v("操作")])])]),t("tbody",e._l(e.newTable.columns,(function(a,s){return t("tr",{key:s},[t("td",[t(K.A,{attrs:{label:"列名",required:"",clearable:""},model:{value:a.name,callback:function(t){e.$set(a,"name",t)},expression:"col.name"}})],1),t("td",[t(V.A,{attrs:{items:e.dataTypes,label:"选择类型",required:""},model:{value:a.type,callback:function(t){e.$set(a,"type",t)},expression:"col.type"}})],1),t("td",[t(n.A,{attrs:{icon:"",color:"red"},on:{click:function(t){return e.removeColumn(s)}}},[t(P.A,[e._v("mdi-delete")])],1)],1)])})),0)]},proxy:!0}])})],1),t(W.SL,[t(u.A),t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:e.createTable}},[e._v("创建")])],1)],1)],1),t(R.A,{attrs:{persistent:"","max-width":"600px"},model:{value:e.showAddItem,callback:function(t){e.showAddItem=t},expression:"showAddItem"}},[t(y.A,[t(W.ri,[e._v("添加数据到 "+e._s(e.selectedTable))]),t(W.OQ,[t(B.A,{ref:"form",model:{value:e.valid,callback:function(t){e.valid=t},expression:"valid"}},[t(C.A,e._l(e.tableHeaders,(function(a,s){return t(U.A,{key:s},[t(T.A,{attrs:{cols:"12"}},[t(K.A,{attrs:{label:`Enter ${a.text}`},model:{value:e.newRow[a.value],callback:function(t){e.$set(e.newRow,a.value,t)},expression:"newRow[header.value]"}})],1)],1)})),1)],1)],1),t(W.SL,[t(n.A,{attrs:{color:"primary"},on:{click:e.submitData}},[e._v("新增")]),t(n.A,{attrs:{text:"",color:"red"},on:{click:function(t){e.showAddItem=!1}}},[e._v("取消")])],1)],1)],1)],1)},ee=[],te=a(1250),ae={name:"WarehouseManager",created(){this.loadWarehouses()},data(){return{showCreateDialog:!1,newWarehouse:{name:"",charset:"",collation:""},charsets:[{label:"utf8mb4",value:"utf8mb4"},{label:"utf8",value:"utf8"}],collations:[{label:"utf8mb4_unicode_ci",value:"utf8mb4_unicode_ci"},{label:"utf8_unicode_ci",value:"utf8_unicode_ci"}],warehouses:[],selectedWarehouse:null,tables:[],selectedTable:null,selectedTableIndex:null,showTableDialog:null,newTable:{name:"",columns:[]},tableRows:[],tableHeaders:[],showCreateTableDialog:!1,dataTypes:["INT","VARCHAR(255)","TEXT","DATE"],newRow:{},valid:!0,showAddItem:!1,organization:null,newWarehouseSuffix:""}},mounted(){this.organization=sessionStorage.getItem("organization"),this.loadWarehouses(),console.log(this.organization)},computed:{filteredWarehouses(){return this.warehouses.filter((e=>e.startsWith(this.organization)))}},methods:{openCreateDialog(){this.showCreateDialog=!0},createWarehouse(){this.newWarehouse.charset&&this.newWarehouse.collation?(this.newWarehouse.name=`${this.organization}_${this.newWarehouseSuffix}`,te.A.post("http://localhost:8081/api/warehouses",this.newWarehouse).then((e=>{console.log("Warehouse created:",e.data),this.warehouses.push(this.newWarehouse.name),this.resetForm(),this.showCreateDialog=!1,alert("创建数据仓库成功。")})).catch((e=>{console.error("Error creating warehouse:",e),alert("创建数据仓库失败。")}))):alert("所有字段都是必填项。")},resetForm(){this.newWarehouse={name:"",charset:"",collation:""}},loadWarehouses(){te.A.get("http://localhost:8081/api/getwarehouses").then((e=>{this.warehouses=e.data,console.log(this.warehouses)})).catch((e=>{console.error("Error loading warehouses:",e)}))},updateWarehouseName(){this.newWarehouse.name=`${this.organization}_${this.newWarehouse.name.split("_").slice(1).join("_")}`},selectWarehouse(e){this.selectedWarehouse===e?this.selectedWarehouse=null:(this.selectedWarehouse=e,this.loadTables(e))},deleteWarehouse(){this.selectedWarehouse?confirm(`确定要删除 ${this.selectedWarehouse} 数据仓库吗？`)&&te.A.delete(`http://localhost:8081/api/deletewarehouses/${this.selectedWarehouse}`).then((e=>{alert("数据仓库已删除！"),this.warehouses=this.warehouses.filter((e=>e!==this.selectedWarehouse)),this.selectedWarehouse=null})).catch((e=>{console.error("删除数据仓库失败：",e),alert("删除数据仓库失败！")})):alert("请先选择一个数据仓库！")},loadTables(e){te.A.get(`http://localhost:8081/api/warehouses/${e}/tables`).then((e=>{this.tables=e.data,this.selectedTable=null,this.selectedTableIndex=null})).catch((e=>{console.error("Error loading tables:",e)}))},selectTable(e,t){this.selectedTable===e?(this.selectedTable=null,this.selectedTableIndex=-1,this.tableRows=[],this.tableHeaders=[]):(this.selectedTable=e,this.selectedTableIndex=t,te.A.get(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables/${e}`).then((e=>{console.log(e.data),this.tableRows=e.data.data,this.tableHeaders=e.data.columns.map((e=>({text:e,value:e})))})).catch((e=>{console.error("Error loading table details:",e)})))},createTable(){this.newTable.name?0===this.newTable.columns.length||this.newTable.columns.some((e=>!e.name||!e.type))?alert("请确保所有列都填写了名称和数据类型！"):(console.log(this.newTable),te.A.post(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables`,{tableName:this.newTable.name,columns:this.newTable.columns}).then((()=>{alert("表创建成功！"),this.tables.push(this.newTable.name),this.showTableDialog=!1,this.newTable={name:"",columns:[]},this.showCreateTableDialog=!1})).catch((e=>{console.error("创建表失败:",e),alert("创建表失败！")}))):alert("请输入表名！")},deleteTable(e){te.A.delete(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables/${e}`).then((()=>{alert("表删除成功！"),this.tables=this.tables.filter((t=>t!==e))})).catch((e=>{console.error("删除表失败:",e),alert("删除表失败！")}))},addNewColumn(){this.newTable.columns.push({name:"",type:""})},removeColumn(e){this.newTable.columns.splice(e,1)},submitData(){te.A.post(`http://localhost:8081/api/warehouses/${this.selectedWarehouse}/tables/${this.selectedTable}/data`,this.newRow).then((()=>{alert("Data added successfully!"),this.newRow={},this.showAddItem=!1})).catch((e=>{console.error("Error adding data:",e),alert("Failed to add data!")}))}}},se=ae,oe=(0,f.A)(se,Y,ee,!1,null,"5be8a568",null),re=oe.exports,le=function(){var e=this,t=e._self._c;return t(C.A,[t(U.A,[t(T.A,{attrs:{cols:"12",md:"6"}},[t(V.A,{attrs:{items:e.filteredWarehouses,"item-text":"name","item-value":"id",label:"选择数据仓库","return-object":""},on:{change:e.onWarehouseSelect},model:{value:e.selectedWarehouseId,callback:function(t){e.selectedWarehouseId=t},expression:"selectedWarehouseId"}})],1),t(T.A,{attrs:{cols:"12",md:"6"}},[t(n.A,{attrs:{color:"primary",disabled:!e.selectedWarehouseId},on:{click:e.performFullBackup}},[e._v("执行全量备份")]),t(n.A,{attrs:{color:"secondary",disabled:!e.selectedWarehouseId},on:{click:e.performIncrementalBackup}},[e._v("执行增量备份")])],1)],1),t(U.A,[e.databaseStats?t("div",[t("h3",[e._v("表总数: "+e._s(e.databaseStats.tableCount))]),t(q.A,{staticClass:"elevation-1",attrs:{headers:[{text:"表名",value:"TABLE_NAME"},{text:"大小 (MB)",value:"SIZE_MB"}],items:e.databaseStats.tableSizes}})],1):e._e()]),t(U.A,[t("h3",[e._v("历史备份记录")]),t(T.A,{attrs:{cols:"12"}},[t(q.A,{staticClass:"elevation-1",attrs:{headers:e.backupHeaders,items:e.backups}})],1)],1)],1)},ie=[],ne={name:"WarehouseMonitor",created(){this.loadWarehouses()},data(){return{warehouses:[],selectedWarehouseId:null,selectedWarehouse:null,databaseStats:null,backups:[],backupHeaders:[{text:"备份类型",value:"backupType"},{text:"备份时间",value:"backupTime"},{text:"状态",value:"status"}],organization:null}},computed:{filteredWarehouses(){return this.warehouses.filter((e=>e.startsWith(this.organization)))}},methods:{loadWarehouses(){te.A.get("http://localhost:8081/api/getwarehouses").then((e=>{this.warehouses=e.data})).catch((e=>{console.error("Error loading warehouses:",e)}))},performFullBackup(){this.selectedWarehouse&&te.A.post(`http://localhost:8081/api/backup/full/${this.selectedWarehouse}`).then((e=>{alert(e.data),this.loadBackupHistory()})).catch((e=>{console.error("全量备份失败:",e)}))},performIncrementalBackup(){this.selectedWarehouse&&te.A.post(`http://localhost:8081/api/backup/incremental/${this.selectedWarehouse}`).then((e=>{alert(e.data),this.loadBackupHistory()})).catch((e=>{console.error("增量备份失败:",e)}))},loadBackupHistory(){te.A.get(`http://localhost:8081/api/backup-history/${this.selectedWarehouse}`).then((e=>{this.backups=e.data,console.log(e.data)})).catch((e=>{console.error("加载备份历史失败:",e)}))},onWarehouseSelect(e){this.selectedWarehouse=e,console.log(e),te.A.get(`http://localhost:8081/api/warehouses/${e}/stats`).then((e=>{this.databaseStats=e.data,this.loadBackupHistory()})).catch((e=>{console.error("获取数据库统计信息失败:",e),this.databaseStats=null}))}},mounted(){this.loadBackupHistory(),this.organization=sessionStorage.getItem("organization"),this.loadWarehouses()}},ce=ne,ue=(0,f.A)(ce,le,ie,!1,null,"0b489b85",null),de=ue.exports,he=a(7043),pe=function(){var e=this,t=e._self._c;return t(C.A,{staticClass:"login-container",attrs:{fluid:""}},[t(U.A,{attrs:{align:"center",justify:"center"}},[t(T.A,{attrs:{cols:"12",md:"4"}},[t(y.A,{staticClass:"elevation-12"},[t(he.A,{attrs:{color:"primary",dark:"",flat:""}},[t(d.sw,[e._v("数据仓库安全信息管理系统")])],1),t(W.OQ,[t(B.A,{ref:"form",on:{submit:function(t){return t.preventDefault(),e.login.apply(null,arguments)}},model:{value:e.valid,callback:function(t){e.valid=t},expression:"valid"}},[t(K.A,{attrs:{rules:[e=>!!e||"Username is required"],label:"Username",required:""},model:{value:e.username,callback:function(t){e.username=t},expression:"username"}}),t(K.A,{attrs:{rules:[e=>!!e||"Password is required"],label:"Password",type:"password",required:""},model:{value:e.password,callback:function(t){e.password=t},expression:"password"}}),t(n.A,{attrs:{disabled:!e.valid,type:"submit",color:"primary",block:""}},[e._v("登录")])],1)],1)],1)],1)],1)],1)},me=[],be={data(){return{valid:!0,username:"",password:""}},methods:{async login(){const e={username:this.username,password:this.password};try{const t=await te.A.post("http://localhost:8081/api/login",e);console.log("登录成功",t.data),sessionStorage.setItem("organization",t.data.organization),t.data.redirectUrl.includes("/admin")?await this.$router.push("/admin"):await this.$router.push("/home")}catch(t){console.error("登录失败",t.response),t.response&&401===t.response.status&&(this.errorMessage="登录失败，请检查您的用户名和密码是否正确。")}}}},fe=be,ve=(0,f.A)(fe,pe,me,!1,null,"bcd99e0e",null),Ae=ve.exports,we=a(7155),ge=function(){var e=this,t=e._self._c;return t(C.A,[t(U.A,[t(T.A,[t(n.A,{attrs:{color:"primary"},on:{click:e.openDialog}},[e._v("新增用户")]),t(R.A,{attrs:{"max-width":"600px"},model:{value:e.dialog,callback:function(t){e.dialog=t},expression:"dialog"}},[t(y.A,[t(W.ri,[t("span",{staticClass:"headline"},[e._v(e._s(e.isEdit?"编辑用户":"新增用户"))])]),t(W.OQ,[t(B.A,{ref:"form",model:{value:e.valid,callback:function(t){e.valid=t},expression:"valid"}},[t(K.A,{attrs:{rules:[e=>!!e||"Username is required"],label:"用户名",required:""},model:{value:e.editedUser.username,callback:function(t){e.$set(e.editedUser,"username",t)},expression:"editedUser.username"}}),t(K.A,{attrs:{rules:[e=>!!e||"Password is required"],label:"密码",type:"password",required:""},model:{value:e.editedUser.password,callback:function(t){e.$set(e.editedUser,"password",t)},expression:"editedUser.password"}}),t(we.A,{attrs:{label:"是否为管理员"},model:{value:e.editedUser.admin,callback:function(t){e.$set(e.editedUser,"admin",t)},expression:"editedUser.admin"}}),t(we.A,{attrs:{label:"账号是否启用"},model:{value:e.editedUser.enabled,callback:function(t){e.$set(e.editedUser,"enabled",t)},expression:"editedUser.enabled"}}),t(K.A,{attrs:{label:"组织"},model:{value:e.editedUser.organization,callback:function(t){e.$set(e.editedUser,"organization",t)},expression:"editedUser.organization"}})],1)],1),t(W.SL,[t(u.A),t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:e.closeDialog}},[e._v("取消")]),t(n.A,{attrs:{color:"blue darken-1",text:""},on:{click:e.saveUser}},[e._v("保存")])],1)],1)],1)],1)],1),t(q.A,{staticClass:"elevation-1",attrs:{headers:e.headers,items:e.users},scopedSlots:e._u([{key:"item.actions",fn:function({item:a}){return[t(P.A,{attrs:{small:""},on:{click:function(t){return e.editUser(a)}}},[e._v(" mdi-pencil ")]),t(P.A,{attrs:{small:""},on:{click:function(t){return e.deleteUser(a)}}},[e._v(" mdi-delete ")])]}}])})],1)},_e=[],xe={data(){return{dialog:!1,valid:!0,isEdit:!1,editedUser:{username:"",password:"",admin:!1,enabled:!0,organization:""},headers:[{text:"用户名",value:"username"},{text:"是否为管理员",value:"admin"},{text:"是否启用",value:"enabled"},{text:"隶属组织",value:"organization"},{text:"操作",value:"actions",sortable:!1}],users:[]}},methods:{openDialog(){this.isEdit=!1,this.editedUser={username:"",password:"",admin:!1,enabled:!0,organization:""},this.dialog=!0},closeDialog(){this.dialog=!1},async fetchUsers(){try{const e=await te.A.get("http://localhost:8081/api/users");this.users=e.data,console.log(e.data)}catch(e){console.error("Failed to fetch users:",e)}},async saveUser(){if(this.$refs.form.validate())try{this.isEdit?await te.A.put(`http://localhost:8081/api/users/${this.editedUser.id}`,this.editedUser):await te.A.post("http://localhost:8081/api/users",this.editedUser),await this.fetchUsers(),this.closeDialog()}catch(e){console.error("Failed to save user:",e)}},editUser(e){this.isEdit=!0,this.editedUser={...e},this.dialog=!0},async deleteUser(e){try{await te.A.delete(`http://localhost:8081/api/users/${e.id}`),await this.fetchUsers()}catch(t){console.error("Failed to delete user:",t)}}},mounted(){this.fetchUsers()}},ke=xe,ye=(0,f.A)(ke,ge,_e,!1,null,null,null),We=ye.exports;s["default"].use(k.Ay);var Te=new k.Ay({mode:"history",routes:[{path:"/",component:A,children:[{path:"home",component:E},{path:"manager",component:re},{path:"monitor",component:de}]},{path:"/login",component:Ae},{path:"/admin",component:We}]}),Ce=a(5353);s["default"].use(Ce.Ay);var $e=new Ce.Ay.Store({state:{},getters:{},mutations:{},actions:{},modules:{}}),Ue=a(1052),Se=a.n(Ue);const Ie=te.A.create({baseURL:"/api",timeout:5e3});Ie.interceptors.request.use((e=>(e.headers["Content-Type"]="application/json;charset=utf-8",e)),(e=>Promise.reject(e))),Ie.interceptors.response.use((e=>{let t=e.data;return"blob"===e.config.responseType||"string"===typeof t&&(t=t?JSON.parse(t):t),t}),(e=>(console.log("err"+e),Promise.reject(e))));var De=Ie,ze=a(8292),Oe=a(5453);s["default"].use(Oe.A);var Ee=new Oe.A({});s["default"].config.productionTip=!1,s["default"].use(Se()),s["default"].use(ze.Ay$),s["default"].prototype.request=De,new s["default"]({router:Te,store:$e,vuetify:Ee,render:e=>e(x)}).$mount("#app")}},t={};function a(s){var o=t[s];if(void 0!==o)return o.exports;var r=t[s]={id:s,loaded:!1,exports:{}};return e[s].call(r.exports,r,r.exports,a),r.loaded=!0,r.exports}a.m=e,function(){a.amdO={}}(),function(){var e=[];a.O=function(t,s,o,r){if(!s){var l=1/0;for(u=0;u<e.length;u++){s=e[u][0],o=e[u][1],r=e[u][2];for(var i=!0,n=0;n<s.length;n++)(!1&r||l>=r)&&Object.keys(a.O).every((function(e){return a.O[e](s[n])}))?s.splice(n--,1):(i=!1,r<l&&(l=r));if(i){e.splice(u--,1);var c=o();void 0!==c&&(t=c)}}return t}r=r||0;for(var u=e.length;u>0&&e[u-1][2]>r;u--)e[u]=e[u-1];e[u]=[s,o,r]}}(),function(){a.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return a.d(t,{a:t}),t}}(),function(){a.d=function(e,t){for(var s in t)a.o(t,s)&&!a.o(e,s)&&Object.defineProperty(e,s,{enumerable:!0,get:t[s]})}}(),function(){a.g=function(){if("object"===typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(e){if("object"===typeof window)return window}}()}(),function(){a.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)}}(),function(){a.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})}}(),function(){a.nmd=function(e){return e.paths=[],e.children||(e.children=[]),e}}(),function(){var e={524:0};a.O.j=function(t){return 0===e[t]};var t=function(t,s){var o,r,l=s[0],i=s[1],n=s[2],c=0;if(l.some((function(t){return 0!==e[t]}))){for(o in i)a.o(i,o)&&(a.m[o]=i[o]);if(n)var u=n(a)}for(t&&t(s);c<l.length;c++)r=l[c],a.o(e,r)&&e[r]&&e[r][0](),e[r]=0;return a.O(u)},s=self["webpackChunkunitytest"]=self["webpackChunkunitytest"]||[];s.forEach(t.bind(null,0)),s.push=t.bind(null,s.push.bind(s))}();var s=a.O(void 0,[504],(function(){return a(7554)}));s=a.O(s)})();
//# sourceMappingURL=app.e695ae1b.js.map