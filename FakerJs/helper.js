import { faker as f } from '@faker-js/faker';

export const getBasicUserInfo = () => {
    return {
        fname: f.name.firstName(),
        lname: f.name.lastName(),
        cin: f.helpers.replaceCreditCardSymbols('#{12}'),
        contact: f.helpers.replaceCreditCardSymbols('03[2-4]#{7}'),
        email: f.internet.email()
    };
}
export const separateOrEnd = (i, N) => {
    return (i !== N) ? 
            ',\n' : 
            '\n;';
}

export const getVehicleInfo = () => {
    return {
        matricule: f.helpers.replaceSymbols("#### ???"),
        status: f.helpers.arrayElement([true, false]),
        nb_place: f.helpers.arrayElement([16, 10])
    }
}
export const getCityName = ()=>{
    return{
        nom_ville: f.address.cityName()
    }
}
