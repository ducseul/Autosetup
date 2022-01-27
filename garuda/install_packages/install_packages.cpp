#include <stdlib.h>
#include <fstream>
#include <string>
#include <iostream>

std::string PacmanCmd(const std::string& options,
                      const std::string& package_name) {
    std::string cmd("sudo pacman ");
    if (!options.empty()) {
        cmd.append(options);
    }
    cmd.append(" ");
    cmd.append(package_name);
    cmd.append(" --noconfirm");
    return cmd;
}

bool exists(const std::string& package_name) {
    std::string cmd = PacmanCmd("-Q", package_name);
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
    ifs.open("install_packages/required_packages.txt");
    if (ifs.good()) {
        std::string package_name;
        while (std::getline(ifs, package_name)) {
            if (exists(package_name)) {
                std::cout << package_name << " Has Already Existed\n";
                continue;
            }
            std::string cmd = PacmanCmd("-S", package_name);
            system(cmd.c_str());           
        }
    }
    
    return 0;
}
