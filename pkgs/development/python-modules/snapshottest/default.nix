{
  lib,
  buildPythonPackage,
  fetchPypi,
  fastdiff,
  six,
  termcolor,
  pytestCheckHook,
  pytest-cov-stub,
  django,
}:

buildPythonPackage rec {
  pname = "snapshottest";
  version = "0.6.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0g35ggqw4jd9zmazw55kj6gfjdghv49qx4jw5q231qyqj8fzijmv";
  };

  propagatedBuildInputs = [
    fastdiff
    six
    termcolor
  ];

  nativeCheckInputs = [
    django
    pytestCheckHook
    pytest-cov-stub
  ];

  pythonImportsCheck = [ "snapshottest" ];

  meta = with lib; {
    description = "Snapshot testing for pytest, unittest, Django, and Nose";
    homepage = "https://github.com/syrusakbary/snapshottest";
    license = licenses.mit;
    maintainers = [ ];
  };
}
