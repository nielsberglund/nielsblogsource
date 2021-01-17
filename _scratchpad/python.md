# Python


 .\python.exe -m pip install <module>


 1. Install Python for all users, add it to Path, not as Admin.
 2. Assign the necessary permissions.





 CREATE EXTERNAL LANGUAGE p37dbg
FROM (CONTENT = 'W:\OneDrive\sql-ext-lang\python\python-lang-extension-windows-debug-3.7.zip'
      , FILE_NAME = 'pythonextension.dll');

PythonExtensionUtils::GetEnvVariable


#### No PythonHome

STDOUT message(s) from external script: 2021-01-15 05:14:25.60 Init 2021-01-15 05:14:25.92 InstallExternalLibrary 2021-01-15 05:14:25.92 PythonLibrarySession::Init 2021-01-15 05:14:25.92 PythonLibrarySession::InstallExternalLibrary 2021-01-15 05:14:25.94 Error: Error: could not find environment variable PYTHONHOME 2021-01-15 05:14:25.94 CleanupSession 2021-01-15 05:14:25.94 Cleanup

Msg 39004, Level 16, State 20, Line 0
A 'p37dbg' script error occurred during execution of 'sp_execute_external_script' with HRESULT 0x80004004.

STDOUT message(s) from external script: 2021-01-15 05:14:26.17 Init 2021-01-15 05:14:26.48 InitSession 2021-01-15 05:14:26.48 PythonSession::Init 2021-01-15 05:14:26.48 PythonParamContainer::Init 2021-01-15 05:14:26.48 PythonDataSet::Init 2021-01-15 05:14:26.48 PythonDataSet::Init 2021-01-15 05:14:26.48 Execute 2021-01-15 05:14:26.48 PythonSession::ExecuteWorkflow 2021-01-15 05:14:26.48 PythonInputDataSet::AddColumnsToDictionary 2021-01-15 05:14:26.48 PythonInputDataSet::AddDictionaryToNamespace 2021-01-15 05:14:26.48 PythonOutputDataSet::InitializeDataFrameInNamespace 2021-01-15 05:14:26.49 Error: Python error: : No module named 'text_tools': File "", line 2, in 2021-01-15 05:14:26.49 CleanupSession 2021-01-15 05:14:26.49 PythonSession::Cleanup 2021-01-15 05:14:26.49 PythonDataSet::Cleanup 2021-01-15 05:14:26.49 PythonOutputDataSet::CleanupColumns 2021-01-15 05:14:26.49 PythonDataSet::Cleanup 2021-01-15 05:14:26.49 Cleanup
Total execution time: 00:00:01.138

#### Variable INST2

STDOUT message(s) from external script: 2021-01-15 05:17:50.79 Init 2021-01-15 05:17:51.10 InstallExternalLibrary 2021-01-15 05:17:51.10 PythonLibrarySession::Init 2021-01-15 05:17:51.10 PythonLibrarySession::InstallExternalLibrary Processing c:\program files\microsoft sql server\mssql15.inst2\mssql\externallibraries\5\65537\1\tmp\text_tools-1.0.0-py3-none-any.whl Installing collected packages: text-tools ERROR: Exception: Traceback (most recent call last): File "C:\Python37\lib\distutils\util.py", line 192, in subst_vars return re.sub(r'\$([a-zA-Z_][a-zA-Z_0-9]*)', _subst, s) File "C:\Python37\lib\re.py", line 194, in sub return _compile(pattern, flags).sub(repl, string, count) File "C:\Python37\lib\distutils\util.py", line 189, in _subst return os.environ[var_name] File "C:\Python37\lib\os.py", line 681, in __getitem__ raise KeyError(key) from None KeyError: 'INST2' During handling of the above exception, another exception occurred: Traceback (most recent call last): File "C:\Python37\lib\site-pack

STDOUT message(s) from external script: ages\pip\_internal\cli\base_command.py", line 188, in _main status = self.run(options, args) File "C:\Python37\lib\site-packages\pip\_internal\cli\req_command.py", line 185, in wrapper return func(self, options, args) File "C:\Python37\lib\site-packages\pip\_internal\commands\install.py", line 407, in run use_user_site=options.use_user_site, File "C:\Python37\lib\site-packages\pip\_internal\req\__init__.py", line 71, in install_given_reqs **kwargs File "C:\Python37\lib\site-packages\pip\_internal\req\req_install.py", line 775, in install prefix=prefix, File "C:\Python37\lib\site-packages\pip\_internal\locations.py", line 186, in get_scheme dist_name, user, home, root, isolated, prefix File "C:\Python37\lib\site-packages\pip\_internal\locations.py", line 125, in distutils_scheme i.finalize_options() File "C:\Python37\lib\distutils\command\install.py", line 307, in finalize_options self.expand_basedirs() File "C:\Python37\lib\distutils\command\inst

STDOUT message(s) from external script: all.py", line 475, in expand_basedirs self._expand_attrs(['install_base', 'install_platbase', 'root']) File "C:\Python37\lib\distutils\command\install.py", line 469, in _expand_attrs val = subst_vars(val, self.config_vars) File "C:\Python37\lib\distutils\util.py", line 194, in subst_vars raise ValueError("invalid variable '$%s'" % var) ValueError: invalid variable '$'INST2'' 2021-01-15 05:17:51.95 Error: Pip failed to install the package with exit code 2 2021-01-15 05:17:51.95 CleanupSession 2021-01-15 05:17:51.95 Cleanup

Msg 39004, Level 16, State 20, Line 0
A 'p37dbg' script error occurred during execution of 'sp_execute_external_script' with HRESULT 0x80004004.

STDOUT message(s) from external script: 2021-01-15 05:17:52.17 Init 2021-01-15 05:17:52.47 InitSession 2021-01-15 05:17:52.48 PythonSession::Init 2021-01-15 05:17:52.48 PythonParamContainer::Init 2021-01-15 05:17:52.48 PythonDataSet::Init 2021-01-15 05:17:52.48 PythonDataSet::Init 2021-01-15 05:17:52.48 Execute 2021-01-15 05:17:52.48 PythonSession::ExecuteWorkflow 2021-01-15 05:17:52.48 PythonInputDataSet::AddColumnsToDictionary 2021-01-15 05:17:52.48 PythonInputDataSet::AddDictionaryToNamespace 2021-01-15 05:17:52.48 PythonOutputDataSet::InitializeDataFrameInNamespace 2021-01-15 05:17:52.48 Error: Python error: : No module named 'text_tools': File "", line 2, in 2021-01-15 05:17:52.48 CleanupSession 2021-01-15 05:17:52.48 PythonSession::Cleanup 2021-01-15 05:17:52.48 PythonDataSet::Cleanup 2021-01-15 05:17:52.48 PythonOutputDataSet::CleanupColumns 2021-01-15 05:17:52.48 PythonDataSet::Cleanup 2021-01-15 05:17:52.48 Cleanup



PythonLibrarySession::InstallLibrary



import subprocess;
pipresult = subprocess.run(['C:/Python39/python.exe', '-m', 'pip', 'install', 'C:/Program Files/Microsoft SQL Server/MSSQL15.INST2/MSSQL/ExternalLibraries/5/65541/1/tmp/text_tools-1.0.0-py3-none-any.whl', 
'--no-deps', '--ignore-installed', '--no-cache-dir', '-t', 
'C:/Program Files/Microsoft SQL Server/MSSQL15.INST2/MSSQL/ExternalLibraries/5/65541/1']).returncode



 import subprocess;pipresult = subprocess.run(['C:/Python39/python.exe', '-m', 'pip', 'install', 'C:/Program Files/Microsoft SQL Server/MSSQL15.INST2/MSSQL/ExternalLibraries/5/65544/1/tmp/text_tools-1.0.0-py3-none-any.whl', '--no-deps', '--ignore-installed', '--no-cache-dir', '-t', 'C:/Program Files/Microsoft SQL Server/MSSQL15.INST2/MSSQL/ExternalLibraries/5/65544/1']).returncode

 PythonLibrarySession::InstallLibrary

 bp::exec(installScript.c_str(), m_mainNamespace);