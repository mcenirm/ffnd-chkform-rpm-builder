Name: freeform-nd
Epoch: 1
Version: 3.8.8
Release: 1%{?dist}
Summary: FreeForm ND (FFND) Data Access System

License: Public domain
Group: Applications/Engineering
URL: https://github.com/OPENDAP/freeform_handler/tree/master/FFND
Source0: https://www.opendap.org/pub/source/freeform_handler-%{version}.tar.gz
Source1: configure.ac
Patch0: install-ffnd.patch

%description
FreeForm ND is a way to describe data formats. Originally
developed by the National Geophysical Data Center (NGDC),
this version is maintained by opendap.org as part of their
freeform_handler extension.

%prep
%autosetup -n freeform_handler-%{version}/FFND
cp %{SOURCE1} ./
autoreconf --install && autoconf

%build
%configure
make %{?_smp_mflags}

%install
%make_install

%files
%{_bindir}/bufform
%{_bindir}/checkvar
%{_bindir}/chkform
%{_bindir}/newform
%{_bindir}/readfile
%{_libdir}/libfreeform.a
%{_libdir}/libfreeform.la
%{_libdir}/libfreeform.so
%{_libdir}/libfreeform.so.0
%{_libdir}/libfreeform.so.0.0.0

%changelog
* Wed Oct 25 2017 Michael McEniry <michael.mceniry@uah.edu> 3.8.8-1
- Initial packaging as RPM
