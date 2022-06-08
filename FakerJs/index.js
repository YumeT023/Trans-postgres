import { getBasicUserInfo, getVehicleInfo, separateOrEnd } from './helper.js';

/* 
 * beware: relaunching this file (using console.log) will not generate the
 * same data as in the file 'readyInsert.js'
 */

// === GLOBALS === //
    const N = 50;
    let id = 1;
// === end === //

/* -- CLIENT -- */
    let client = '';
    while (id <= N) {
        const { fname, lname, cin, contact } = getBasicUserInfo();
        client += `     (${id}, '${fname}', '${lname}', '${cin}', '${contact}')`;
        client += separateOrEnd(id, N);
        id ++;
    }
    client = "INSERT INTO CLIENT values\n".concat(client);
    id = 1;
/* -- end -- */


/* -- CHAUFFEUR -- */
    let chauffeur = '';
    while (id <= N) {
        const { fname, lname, cin, contact, email } = getBasicUserInfo();
        chauffeur += `     (${id}, '${fname}', '${lname}', '${cin}', '${contact}', '${email}')`;
        chauffeur += separateOrEnd(id, N);
        id ++;
    }
    chauffeur = "INSERT INTO CHAUFFEUR values\n".concat(chauffeur);
    id = 1;
/* -- end -- */


/* -- VEHICULE -- */
    let vehicule = '';
    while (id <= N) {
        const {matricule, nb_place, status} = getVehicleInfo();
        vehicule += `       ( ${id}, '${matricule}', ${nb_place}, ${status})`;
        vehicule += separateOrEnd(id, N);
        id ++;
    }
    vehicule = "INSERT INTO VEHICULE values\n".concat(vehicule);
    id = 1;
/* -- end -- */