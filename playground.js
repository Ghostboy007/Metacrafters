// create a variable to hold your NFTs
let nftCollection = [];

// this function will take in some values as parameters, create an
// NFT object using the parameters passed to it for its metadata, 
// and store it in the variable above.
function mintNFT(name, creator, description, attributes) {
    // Create an object to hold the NFT metadata
    const nft = {
        name: name,
        creator: creator,
        description: description,
        attributes: attributes
    };

    // Store the NFT in the nftCollection array
    nftCollection.push(nft);
}

// create a "loop" that will go through an "array" of NFTs
// and print their metadata with console.log()
function listNFTs() {
    for (let i = 0; i < nftCollection.length; i++) {
        console.log(`NFT ${i + 1}:`);
        console.log(`Name: ${nftCollection[i].name}`);
        console.log(`Creator: ${nftCollection[i].creator}`);
        console.log(`Description: ${nftCollection[i].description}`);
        console.log(`Attributes: ${JSON.stringify(nftCollection[i].attributes)}`);
        console.log('---------------------');
    }
}

// print the total number of NFTs we have minted to the console
function getTotalSupply() {
    return nftCollection.length;
}

// call your functions below this line

// Mint some example NFTs
mintNFT("NFT 1", "Creator A", "Description for NFT 1", { rarity: "common", power: 10 });
mintNFT("NFT 2", "Creator B", "Description for NFT 2", { rarity: "rare", power: 20 });
mintNFT("NFT 3", "Creator C", "Description for NFT 3", { rarity: "epic", power: 30 });

// List all NFTs
listNFTs();

// Print the total number of NFTs minted
console.log(`Total NFTs minted: ${getTotalSupply()}`);
