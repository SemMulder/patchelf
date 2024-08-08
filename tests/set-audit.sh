#! /bin/sh -e
SCRATCH=scratch/$(basename "$0" .sh)

./simple

rm -rf "${SCRATCH}"
mkdir -p "${SCRATCH}"

cp simple "${SCRATCH}"/
cp libaudit.so "${SCRATCH}"/

../src/patchelf --set-audit '$ORIGIN/libaudit.so' "${SCRATCH}/simple"

echo "running with DT_AUDIT set..."
if "${SCRATCH}/simple" 2&>1  | grep -q 'This is audit!'; then
    echo "libaudit.so was NOT loaded"
    exit 1
else
  echo "libaudit.so was loaded"
fi
