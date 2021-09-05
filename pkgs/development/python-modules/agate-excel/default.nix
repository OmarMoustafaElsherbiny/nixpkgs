{ lib, fetchPypi, buildPythonPackage
, agate, openpyxl, xlrd, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "agate-excel";
  version = "0.2.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "62315708433108772f7f610ca769996b468a4ead380076dbaf6ffe262831b153";
  };

  propagatedBuildInputs = [ agate openpyxl xlrd ];

  checkInputs = [ pytestCheckHook ];

  disabledTests = [
    # See https://github.com/wireservice/agate-excel/issues/45
    "test_ambiguous_date"
  ];

  meta = with lib; {
    description = "Adds read support for excel files to agate";
    homepage    = "https://github.com/wireservice/agate-excel";
    license     = licenses.mit;
    maintainers = with maintainers; [ vrthra ];
  };
}
