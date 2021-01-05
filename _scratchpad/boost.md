# Boost

Boost is a set of libraries for the C++ programming language that provides support for tasks and structures such as linear algebra, pseudorandom number generation, multithreading, image processing, regular expressions, and unit testing. It contains 164 individual libraries (as of version 1.75).[4]

Interface to bind functions in a Python extension module to C/C++ functions/methods. Easy to write Python wrappers for pre-existing native C/C++ libraries. Performance gains of native code with user friendlieness of Python.

Use the BoostPython Library to quickly and easily export C++ to Python such that the Python interface is very similar to the C++ interface. It is designed to be minimally intrusive on your C++ design. In most cases, you should not have to alter your C++ classes in any way in order to use them with Boost.Python. The system should simply reflect your C++ classes and functions into Python. Boost.Python bindings are written in pure C++, using no tools other than your editor and your C++ compiler.

Download: https://www.boost.org/users/history/version_1_75_0.html

Download, and unzip: c:\

Build the Boost.Build engine

cd boost_1_75_0

.\bootstrap.bat


user-config.jam
# Configure specific Python version.

 using python 
   : 3.9
   : C:\\Python39\\python.exe
   : C:\\Python39\\include #directory that contains pyconfig.h
   : C:\\Python39\\libs    #directory that contains python39.lib
   : <toolset>msvc 
   ;


b2 --with-python --prefix=c:\\boost175 --debug-configuration -d0 address-model=64 variant=release link=static threading=multi runtime-link=shared install


RuntimeError: The current Numpy installation ('C:\\Python39\\lib\\site-packages\\numpy\\__init__.py') fails to pass a sanity check due to a bug in the windows runtime. See this issue for more information: https://tinyurl.com/y3dm3h86


change CMakeLists.text to point to Python39

SET CMAKE_ROOT to point to root of CMAKE

SET BOOST_ROOT to pint to c:\\boost175 ?????

SET BOOST_PYTHON_ROOT to pint to c:\\boost175\lib ?????

copy C:\boost175\include\boost-1_75\boost to C:\boost175\include


set DevEnvDir to C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat

change the build-python-extension.cmd
cmake -G "Visual Studio 16 2019" -A x64 ../"

python -m pip install SomePackage

C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Tools\MSVC\14.28.29333\include\experimental/filesyste
m(30,1): fatal error C1189: #error:  The <experimental/filesystem> header providing std::experimental::filesystem is de
precated by Microsoft and will be REMOVED. It is superseded by the C++17 <filesystem> header providing std::filesystem.
 You can define _SILENCE_EXPERIMENTAL_FILESYSTEM_DEPRECATION_WARNING to acknowledge that you have received this warning
. [W:\nielsb-work\Github-Repos\gh-nielsberglund\sql-lang-ext\sql-server-language-extensions\build-output\pythonextensio
n\windows\release\PythonExtension.vcxproj]

88
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsDevCmd.bat" -arch=amd64 -host_arch=amd64

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat" -arch=amd64 -host_arch=amd64

99
CALL "%CMAKE_ROOT%\bin\cmake.exe" ^
  -G "Visual Studio 15 2017 Win64" ^
  -DPLATFORM=Windows ^
  -DENL_ROOT="%ENL_ROOT%" ^
  -DCMAKE_BUILD_TYPE=%CMAKE_CONFIGURATION% ^
  -DPYTHONHOME="%PYTHONHOME%" ^
  -DBOOST_ROOT="%BOOST_ROOT%" ^
  -DBOOST_PYTHON_ROOT="%BOOST_PYTHON_ROOT%" ^
  %PYTHONEXTENSION_HOME%/src

CALL "%CMAKE_ROOT%\bin\cmake.exe" ^
  -G "Visual Studio 16 2019" ^
  -A x64 ^
  -DPLATFORM=Windows ^
  -DENL_ROOT="%ENL_ROOT%" ^
  -DCMAKE_BUILD_TYPE=%CMAKE_CONFIGURATION% ^
  -DPYTHONHOME="%PYTHONHOME%" ^
  -DBOOST_ROOT="%BOOST_ROOT%" ^
  -DBOOST_PYTHON_ROOT="%BOOST_PYTHON_ROOT%" ^
  %PYTHONEXTENSION_HOME%/src  

  PythonLibrarySession.h

  #include <experimental/filesystem> -> #include <filesystem>

  CMakeLists.txt

  74
  find_library(PYTHON_LIB python37 ${PYTHONHOME}/libs) -> find_library(PYTHON_LIB python39 ${PYTHONHOME}/libs)

  84
  find_library(BOOST_PYTHON_LIB libboost_python37-vc140-mt-x64-1_69 ${BOOST_PYTHON_ROOT}) -> find_library(BOOST_PYTHON_LIB libboost_python39-vc142-mt-x64-1_75 ${BOOST_PYTHON_ROOT})

  85
  find_library(BOOST_NUMPY_LIB libboost_numpy37-vc140-mt-x64-1_69 ${BOOST_PYTHON_ROOT}) ->  find_library(BOOST_NUMPY_LIB libboost_numpy39-vc142-mt-x64-1_75 ${BOOST_PYTHON_ROOT})



PythonExtension.cpp, PythonExtensionUtils_win.cpp, PythonLibrarySession.cppPythonLibrarySession.cpp
#include <experimental/filesystem>
...
namespace fs = std::experimental::filesystem;
