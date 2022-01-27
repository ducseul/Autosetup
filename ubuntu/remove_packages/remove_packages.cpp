#include <stdlib.h>
#include <fstream>
#include <string>
#include <iostream>

std::string AptCmd(const std::string& options,
                      const std::string& package_name) {
    std::string cmd("sudo apt ");
    if (!options.empty()) {
        cmd.append(options);
    }
    cmd.append(" ");
    cmd.append(package_name);
    cmd.append(" -y");
    return cmd;
}

bool exists(const std::string& package_name) {
    std::string cmd("sudo dpkg-query -s ");
    cmd.append(package_name);
    cmd.append(" 2>/dev/null");
    cmd.append(" > tmp.txt");

    system(cmd.c_str());
    
    std::ifstream ifs("tmp.txt");
    std::string line_1st;
    std::getline(ifs, line_1st);
    ifs.close();
    
    /* if "tmp.txt" DOES NOT have any strings, 
       the "package_name" WILL NOT exist in the system */
    return !line_1st.empty();
}

int main() {
    std::ifstream ifs;
    ifs.open("remove_packages/unneeded_packages.txt");
    if (ifs.good()) {
        std::string package_name;
        while (std::getline(ifs, package_name)) {
            std::string cmd = AptCmd("remove", package_name);
            system(cmd.c_str());           
        }
    }
    
    return 0;
}
