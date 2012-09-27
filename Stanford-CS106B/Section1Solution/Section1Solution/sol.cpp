struct statsT {
int low;
int high;
double average;
};
/* CalculateStatistics()
 * Usage: stats = CalculateStatistics(filename)
 * --------------------------------------------
 * This function keeps track of the running low/high value
 * as it reads the file, as well as a total and a count to compute
 * the average when we're done
 */
statsT CalculateStatistics(string filename) {
statsT stats;
// Since we know scores are between 0 and 100, we can set low and
// high to beyond their range.  This way, the first update is
// just like the rest.
// Otherwise, we'd need a sentinel and a little more logic
stats.low = 101;
stats.high = -1;
int total = 0;
int count = 0;
// Open a new filestream and make sure it worked
ifstream in;
in.open(filename.c_str());
if (in.fail()) Error("Couldn't read '" + filename + "'");
while(true) {
int num;
in >> num;
// Check that we read successfully
if (in.fail()) break;
// Update or data if we need to
if (num < stats.low) stats.low = num;
if (num > stats.high) stats.high = num;
total += num;
count++;
}
// Don't forget to watch for integer division!
stats.average = double(total)/count;
// And make sure to close your files
in.close();
return stats;
}